using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;

namespace BEL
{
    public class ApuProyecto
    {
        private static Apu_ProyectoTableAdapter _Adapter;
        private static Apu_ProyectoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_ProyectoTableAdapter();
                return _Adapter;
            }
        }

        private static Apu_CategoriaTableAdapter _AdapterApuCategoria;
        private static Apu_CategoriaTableAdapter AdapterApuCategoria
        {
            get
            {
                if (_AdapterApuCategoria == null)
                    _AdapterApuCategoria = new Apu_CategoriaTableAdapter();
                return _AdapterApuCategoria;
            }
        }

        private static Apu_Proyecto_CategoriaTableAdapter _AdapterApuProyectoCategoria;
        private static Apu_Proyecto_CategoriaTableAdapter AdapterApuProyectoCategoria
        {
            get
            {
                if (_AdapterApuProyectoCategoria == null)
                    _AdapterApuProyectoCategoria = new Apu_Proyecto_CategoriaTableAdapter();
                return _AdapterApuProyectoCategoria;
            }
        }

        private static Apu_ParametrosTableAdapter _AdapterApuParametros;
        private static Apu_ParametrosTableAdapter AdapterApuParametros
        {
            get
            {
                if (_AdapterApuParametros == null)
                    _AdapterApuParametros = new Apu_ParametrosTableAdapter();
                return _AdapterApuParametros;
            }
        }

        private static Apu_Mano_ObraTableAdapter _AdapterManoObra;
        private static Apu_Mano_ObraTableAdapter AdapterManoObra
        {
            get
            {
                if (_AdapterManoObra == null)
                    _AdapterManoObra = new Apu_Mano_ObraTableAdapter();
                return _AdapterManoObra;
            }
        }

        private static Apu_Proyecto_Mano_ObraTableAdapter _AdapterApuProyectoManoObra;
        private static Apu_Proyecto_Mano_ObraTableAdapter AdapterApuProyectoManoObra
        {
            get
            {
                if (_AdapterApuProyectoManoObra == null)
                    _AdapterApuProyectoManoObra = new Apu_Proyecto_Mano_ObraTableAdapter();
                return _AdapterApuProyectoManoObra;
            }
        }


        public static string Insert(Scope s, Apu_Proyecto o)
        {
            string IdApuProyecto = InsertApuProyecto(s, o);
            
            //INSERT EN APU_PROYECTO_CATEGORIA
            Apu.Apu_CategoriaDataTable dtbApuCategoria = AdapterApuCategoria.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id, s.Int_Sucursal_Id);
            foreach (Apu.Apu_CategoriaRow categoria in dtbApuCategoria)
            {
                Apu_Proyecto_Categoria apuProyectoCategoria = new Apu_Proyecto_Categoria();
                apuProyectoCategoria.Apu_Proyecto_Id = IdApuProyecto;
                apuProyectoCategoria.Apu_Categoria_Id = categoria.Id;
                // REVISAR
                apuProyectoCategoria.Costo_Diario = categoria.Costo_Diario;
                
                InsertApuProyectoCategoria(s, apuProyectoCategoria);
            }

            //INSERT EN APU_PROYECTO_MANO_OBRA
            Apu.Apu_ParametrosDataTable dtbApuParametros = AdapterApuParametros.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id);
            if (dtbApuParametros.Count != 1) throw new Exception(string.Format("No hay parametros en la sucursal Id: {0}", s.Int_Sucursal_Id));
            
            Apu.Apu_Mano_ObraDataTable dtbApuManoObra =
                AdapterManoObra.GetById(s.Ver_Version_Id, dtbApuParametros[0].Apu_Mano_Obra_Id);
            if (dtbApuManoObra.Count != 1) throw new Exception(string.Format("No hay mano obra con Id: {0}", dtbApuParametros[0].Apu_Mano_Obra_Id));

            Apu_Proyecto_Mano_Obra apuPoryectoManoObra = new Apu_Proyecto_Mano_Obra();
            apuPoryectoManoObra.Apu_Proyecto_Id = IdApuProyecto;
            apuPoryectoManoObra.Costo_Diario = dtbApuManoObra[0].Costo_Diario;
            apuPoryectoManoObra.Apu_Mano_Obra_Id = dtbApuManoObra[0].Id;
            apuPoryectoManoObra.Apu_Categoria_Id = dtbApuManoObra[0].Apu_Categoria_Id;

            InsertApuProyectoManoObra(s, apuPoryectoManoObra);

            return IdApuProyecto;
        }

        private static string InsertApuProyecto(Scope s, Apu_Proyecto o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Codigo_Institucion,
                    o.Nombre,
                    o.Apu_Lugar_Id,
                    o.Area,
                    o.Porcentaje_Costo_Indirecto,
                    o.Porcentaje_Costo_Otros,
                    o.Fecha_Creacion,
                    o.Coordinador_Per_Personal_Id,
                    o.Tecnico_Per_Personal_Id,
                    o.Etapa,
                    o.Int_Sucursal_Id,
                    o.Int_Moneda_Id,
                    o.Fecha_Update,
                    o.Creacion_Per_Personal_Id,
                    o.Update_Per_Personal_Id,
                    o.Estado,
                    o.Costo_Directo,
                    o.Costo_Total,
                    o.Costo_Indirecto,
                    o.Costo_Otros,
                    o.Descripcion,
                    o.Tipo_Contrato);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        public static string InsertApuProyectoCategoria(Scope s, Apu_Proyecto_Categoria o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApuProyectoCategoria.Insert(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Id,
                    o.Apu_Categoria_Id,
                    o.Costo_Diario,
                    o.Estado);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return InsertApuProyectoCategoria(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        public static string InsertApuProyectoManoObra(Scope s, Apu_Proyecto_Mano_Obra o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApuProyectoManoObra.Insert(
                    o.Id,
                    o.Codigo,
                    o.Costo_Diario,
                    o.Apu_Proyecto_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Apu_Indice_Id,
                    o.Apu_Categoria_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return InsertApuProyectoManoObra(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
    }
}
