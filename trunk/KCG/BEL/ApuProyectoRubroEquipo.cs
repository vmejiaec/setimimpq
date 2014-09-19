using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;

namespace BEL
{
    public class ApuProyectoRubroEquipo
    {
        private static Apu_Proyecto_Rubro_EquipoTableAdapter _Adapter;
        private static Apu_Proyecto_Rubro_EquipoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Proyecto_Rubro_EquipoTableAdapter();
                return _Adapter;
            }
        }

        private static Apu_EquipoTableAdapter _AdapterApuEquipo;
        private static Apu_EquipoTableAdapter AdapterApuEquipo
        {
            get
            {
                if (_AdapterApuEquipo == null)
                    _AdapterApuEquipo = new Apu_EquipoTableAdapter();
                return _AdapterApuEquipo;
            }
        }

        private static Apu_Proyecto_EquipoTableAdapter _AdapterApuProyectoEquipo;
        private static Apu_Proyecto_EquipoTableAdapter AdapterApuProyectoEquipo
        {
            get
            {
                if (_AdapterApuProyectoEquipo == null)
                    _AdapterApuProyectoEquipo = new Apu_Proyecto_EquipoTableAdapter();
                return _AdapterApuProyectoEquipo;
            }
        }



        public static string Insert(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            Apu.Apu_EquipoDataTable dtaApuEquipo = AdapterApuEquipo.GetByProyectoRubroEquipo(s.Ver_Version_Id, o.Apu_Proyecto_Rubro_Id, o.Apu_Equipo_Id);

            if (dtaApuEquipo.Count == 0)
            {
                Apu.Apu_EquipoDataTable dtaApuEquipoTemp = AdapterApuEquipo.GetById(s.Ver_Version_Id, o.Apu_Equipo_Id);
                if(dtaApuEquipoTemp.Count == 1)
                {
                    Apu_Proyecto_Equipo oTemp = new Apu_Proyecto_Equipo();
                    oTemp.Apu_Equipo_Id = dtaApuEquipoTemp[0].Id;
                    oTemp.Apu_Proyecto_Id = o.Apu_Proyecto_Id;
                    oTemp.Costo_Combustible = dtaApuEquipoTemp[0].Costo_Combustible;
                    oTemp.Costo_Repuesto = dtaApuEquipoTemp[0].Costo_Repuesto;
                    oTemp.Costo_Mantenimiento = dtaApuEquipoTemp[0].Costo_Mantenimiento;
                    oTemp.Costo_Alquiler = dtaApuEquipoTemp[0].Costo_Alquiler;
                    oTemp.Costo_Otros = dtaApuEquipoTemp[0].Costo_Otros;

                    InsertApuProyectoEquipo(s, oTemp);
                }
            }


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
                    o.Apu_Proyecto_Rubro_Id,
                    o.Apu_Equipo_Id,
                    o.Cantidad,
                    o.Fecha_Creacion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Update_Per_Personal_Id,
                    o.Estado
                    );
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(
                            Textos._ERR_VIOLATION_UNIQUE_KEY)
                            )
                            return Insert(s, o);
                        else
                            throw;
                        break;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        private static string InsertApuProyectoEquipo(Scope s, Apu_Proyecto_Equipo o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApuProyectoEquipo.Insert(
                    o.Id,
                    o.Codigo,
                    o.Costo_Combustible,
                    o.Costo_Repuesto,
                    o.Costo_Mantenimiento,
                    o.Costo_Alquiler,
                    o.Costo_Otros,
                    o.Apu_Proyecto_Id,
                    o.Apu_Equipo_Id,
                    o.Estado
                    );
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return InsertApuProyectoEquipo(s, o);
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

        public static int Delete(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            int resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Apu_Proyecto_Rubro_Id,
                o.Apu_Equipo_Id,
                o.Cantidad,
                o.Fecha_Creacion,
                o.Creacion_Per_Personal_Id,
                o.Fecha_Update,
                o.Update_Per_Personal_Id,
                o.Estado);
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);

            int intEquipos = (int)Adapter.ExisteEquipo(o.Apu_Equipo_Id, o.Apu_Proyecto_Rubro_Id);

            if (intEquipos == 0)
            {
                Apu.Apu_Proyecto_EquipoDataTable dtaApuProyectoEquipo = AdapterApuProyectoEquipo.GetByEquipo(s.Ver_Version_Id, o.Apu_Equipo_Id);
                if (dtaApuProyectoEquipo.Count == 1)
                    DeleteApuProyectoEquipo(s, dtaApuProyectoEquipo);
            }

            return resultado;
        }

        private static int DeleteApuProyectoEquipo(Scope s, Apu.Apu_Proyecto_EquipoDataTable o)
        {
            int resultado = AdapterApuProyectoEquipo.Delete(
                o[0].Id,
                o[0].Codigo,
                o[0].Costo_Combustible,
                o[0].Costo_Repuesto,
                o[0].Costo_Mantenimiento,
                o[0].Costo_Alquiler,
                o[0].Costo_Otros,
                o[0].Apu_Proyecto_Id,
                o[0].Apu_Equipo_Id,
                o[0].Estado
                );
            return resultado;
        }

    }
}
