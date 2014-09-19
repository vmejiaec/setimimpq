using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using ADL.VersionTableAdapters;
using AEL.VER;

namespace BEL
{
    public class VerVersion
    {
        private static Ver_VersionTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        private static Ver_VersionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Ver_VersionTableAdapter();
                return _Adapter;
            }
        }

        public static string Insert(Scope s, Ver_Version o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            int valor = (int)Adapter.ExisteRegistros();
            if (valor == 0 && o.Predeterminada == "N")
            {
                o.Predeterminada = "S";
            }
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Abreviatura,
                    o.Predeterminada,
                    o.Ruta_Imagen,
                    o.Estado,
                    o.Descripcion);
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
    }
}
