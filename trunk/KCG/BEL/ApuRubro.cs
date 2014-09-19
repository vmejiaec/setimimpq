using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;

namespace BEL
{
    public class ApuRubro
    {
        private static Apu_RubroTableAdapter _AdapterApu_Rubro;

        private static Apu_RubroTableAdapter AdapterApu_Rubro
        {
            get
            {
                if (_AdapterApu_Rubro == null)
                    _AdapterApu_Rubro = new Apu_RubroTableAdapter();
                return _AdapterApu_Rubro;
            }
        }

        private static Apu_Rubro_TecnicaTableAdapter _AdapterApu_Rubro_Tecnica;
        
        private static Apu_Rubro_TecnicaTableAdapter AdapterApu_Rubro_Tecnica
        {
            get
            {
                if (_AdapterApu_Rubro_Tecnica == null)
                    _AdapterApu_Rubro_Tecnica = new Apu_Rubro_TecnicaTableAdapter();
                return _AdapterApu_Rubro_Tecnica;
            }
        }

        private static string InsertApu_Rubro_Tecnica(Scope s, Apu_Rubro_Tecnica o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApu_Rubro_Tecnica.Insert(

                     o.Id,
                     o.Codigo,
                     o.Apu_Rubro_Id,
                     o.Imagen,
                     o.Origen_Imagen,
                     o.Definicion,
                     o.Especificacion,
                     o.Medicion,
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
                            return InsertApu_Rubro_Tecnica(s, o);
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

        private static string InsertApu_Rubro(Scope s, Apu_Rubro o)
        {
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();

            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApu_Rubro.Insert(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Unidad,
                  o.Int_Sucursal_Id,
                  o.Apu_Subtitulo_id,
                  o.Int_Moneda_Id,
                  o.Rendimiento_Mano_Obra,
                  o.Rendimiento_Equipo,
                  o.Especial,
                  o.Disponible,
                  o.Descripcion,
                  o.Creacion_Per_Personal_Id,
                  o.Fecha_Creacion,
                  o.Update_Per_Personal_Id,
                  o.Fecha_Update,
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
                            return InsertApu_Rubro(s, o);
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

        public static string Insert(Scope s, Apu_Rubro o)
        {
            string resultado = InsertApu_Rubro(s, o);
            Apu_Rubro_Tecnica oApuRubroTecnica = new Apu_Rubro_Tecnica();
            oApuRubroTecnica.Apu_Rubro_Id = o.Id;
            InsertApu_Rubro_Tecnica(s, oApuRubroTecnica);
            return resultado;
        }
    }

}
