using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;

namespace BEL
{
    
    public class ApuProyectoRubroMaterial
    {
        private static Apu_Proyecto_Rubro_MaterialTableAdapter _AdapterApu_Proyecto_Rubro_Material;
        private static Apu_Proyecto_Rubro_MaterialTableAdapter AdapterApu_Proyecto_Rubro_Material
        {
            get
            {
                if (_AdapterApu_Proyecto_Rubro_Material == null)
                    _AdapterApu_Proyecto_Rubro_Material = new Apu_Proyecto_Rubro_MaterialTableAdapter();
                return _AdapterApu_Proyecto_Rubro_Material;
            }
        }

        private static Apu_MaterialTableAdapter _AdapterApu_Material;
        private static Apu_MaterialTableAdapter AdapterApuMaterial
        {
            get
            {
                if (_AdapterApu_Material == null)
                    _AdapterApu_Material = new Apu_MaterialTableAdapter();
                return _AdapterApu_Material;
            }
        }

        private static Apu_Proyecto_MaterialTableAdapter _AdapterApu_Proyecto_Material;
        private static Apu_Proyecto_MaterialTableAdapter AdapterApu_Proyecto_Material
        {
            get
            {
                if (_AdapterApu_Proyecto_Material == null)
                    _AdapterApu_Proyecto_Material = new Apu_Proyecto_MaterialTableAdapter();
                return _AdapterApu_Proyecto_Material;
            }
        }

        public static string Insert(Scope s, Apu_Proyecto_Rubro_Material o)
        {
            ADL.Apu.Apu_MaterialDataTable tempApuMaterial =
                GetApuMaterialByProyectoRubroMaterial(s, o.Apu_Proyecto_Rubro_Id, o.Apu_Material_Id);

            if (tempApuMaterial.Count == 0)
            {
                ADL.Apu.Apu_MaterialDataTable ApuMaterial =
                    GetApuMaterial(s, o.Apu_Proyecto_Rubro_Id, o.Apu_Material_Id);

                if (ApuMaterial.Count == 1)
                {
                    Apu_Proyecto_Material apuProyectoMaterial = new Apu_Proyecto_Material();
                    apuProyectoMaterial.Apu_Material_Id = ApuMaterial[0].Id;
                    apuProyectoMaterial.Apu_Proyecto_Id = o.Apu_Proyecto_Id;
                    apuProyectoMaterial.Costo_Parcial = ApuMaterial[0].Costo_Parcial;
                    apuProyectoMaterial.Costo_Otros = ApuMaterial[0].Costo_Otros;
                    apuProyectoMaterial.Costo_Transporte = ApuMaterial[0].Costo_Transporte;
                    //Id del material ingresado
                    //o.Apu_Material_Id = 
                    InsertApu_Proyecto_Material(s, apuProyectoMaterial);
                }
            }
            return InsertApu_Proyecto_Rubro_Material(s, o);
        }

        private static ADL.Apu.Apu_MaterialDataTable GetApuMaterial(Scope s, string Apu_Proyecto_Rubro_Id, string Apu_Material_Id)
        {
            return AdapterApuMaterial.GetById(s.Ver_Version_Id, Apu_Material_Id);
        }

        private static Apu.Apu_MaterialDataTable GetApuMaterialByProyectoRubroMaterial(Scope s, string Apu_Proyecto_Rubro_Id, string Apu_Material_Id)
        {
            return AdapterApuMaterial.GetByProyectoRubroMaterial(s.Ver_Version_Id, Apu_Proyecto_Rubro_Id, Apu_Material_Id);
        }

        private static string InsertApu_Proyecto_Material(Scope s, Apu_Proyecto_Material o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApu_Proyecto_Material.Insert(

                      o.Id,
                      o.Codigo,
                      o.Apu_Material_Id,
                      o.Apu_Proyecto_Id,
                      o.Costo_Parcial,
                      o.Costo_Otros,
                      o.Costo_Transporte,
                      o.Apu_Indice_Id,
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
                            return InsertApu_Proyecto_Material(s, o);
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

        private static string InsertApu_Proyecto_Rubro_Material(Scope s, Apu_Proyecto_Rubro_Material o)
        {
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();

            // Controla el error de clave primaria duplicada.
            try
            {
                AdapterApu_Proyecto_Rubro_Material.Insert(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Rubro_Id,
                    o.Apu_Material_Id,
                    o.Cantidad,
                    o.Fecha_Creacion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Update_Per_Personal_Id,
                    o.Fecha_UpdateTransporte,
                    o.UpdateTransporte_Per_Personal_Id,
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
                            return InsertApu_Proyecto_Rubro_Material(s, o);
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


        public static int Delete(Scope s, Apu_Proyecto_Rubro_Material o)
        {
            int resultado = AdapterApu_Proyecto_Rubro_Material.Delete(
                o.Id,
                o.Codigo,
                o.Apu_Proyecto_Rubro_Id,
                o.Apu_Material_Id,
                o.Cantidad,
                o.Fecha_Creacion,
                o.Creacion_Per_Personal_Id,
                o.Fecha_Update,
                o.Update_Per_Personal_Id,
                o.Fecha_UpdateTransporte,
                o.UpdateTransporte_Per_Personal_Id,
                o.Estado
                );
            
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);

            int regitrosExistentes = (int)AdapterApu_Proyecto_Rubro_Material.ExisteMaterial(o.Apu_Material_Id, o.Apu_Proyecto_Rubro_Id);

            if (regitrosExistentes == 0)
            {
                Apu.Apu_Proyecto_MaterialDataTable ApuProyectoMaterial = AdapterApu_Proyecto_Material.GetByMaterial(s.Ver_Version_Id, o.Apu_Material_Id);
                if(ApuProyectoMaterial.Count == 1)
                {
                    DeleteApu_Proyecto_Material(s, ApuProyectoMaterial);
                }  
            }
            return resultado;
        }

        private static int DeleteApu_Proyecto_Material(Scope s, Apu.Apu_Proyecto_MaterialDataTable o)
        {
        int resultado = AdapterApu_Proyecto_Material.Delete(
              o[0].Id,
              o[0].Codigo,
              o[0].Apu_Material_Id,
              o[0].Apu_Proyecto_Id,
              o[0].Costo_Parcial,
              o[0].Costo_Otros,
              o[0].Costo_Transporte,
              o[0].Apu_Indice_Id,
              o[0].Estado
        );
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
        return resultado;
    }
        

    }
}
