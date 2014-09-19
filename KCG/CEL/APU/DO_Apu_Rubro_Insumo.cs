using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System.Data;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Rubro_Insumo
    /// </summary>
    public class DO_Apu_Rubro_Insumo
    {
        #region Adapter
        private Apu_Rubro_InsumoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Rubro_InsumoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Rubro_InsumoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Rubro_Insumo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Rubro_Insumo</returns> 
        public List<Apu_Rubro_Insumo> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_InsumoDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + 
                          " Apu_Rubro_Insumo_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_InsumoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Insumo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Rubro_Id,
                        fila.Apu_Insumo_Id,
                        fila.Cantidad,
                        fila.Fecha_Update,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Tipo,
                        fila.Tipo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Apu_Insumo_Codigo,
                        fila.Apu_Insumo_Nombre,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.costo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_Id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo,
                        fila.Costo_Total));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro_Insumo> GetByRubro(Scope s, string apu_rubro_id)
        {
            string llamada = "";
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_InsumoDataTable tabla = Adapter.GetByRubro(s.Ver_Version_Id, apu_rubro_id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRubro" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_rubro_id : " + apu_rubro_id 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Insumo_ByRubro " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_InsumoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Insumo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Rubro_Id,
                        fila.Apu_Insumo_Id,
                        fila.Cantidad,
                        fila.Fecha_Update,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Tipo,
                        fila.Tipo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Apu_Insumo_Codigo,
                        fila.Apu_Insumo_Nombre,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.costo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_Id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo,
                        fila.Costo_Total));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro_Insumo> GetBySucursal(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, 
                                                    string Apu_Rubro_Nombre, string Apu_Insumo_Nombre, string Tipo, 
                                                    string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            string llamada = "";
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_InsumoDataTable tabla;
                try
                {
                    tabla = Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta,
                                                  Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre,
                                                  s.Numero_Registros, s.Pagina_Actual);
                }
                catch (SqlException e)
                {
                    throw (e);
                }
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_sucursal_id : " + s.Int_Sucursal_Id + "," 
                        + " Apu_Rubro_Codigo_Desde : " + Apu_Rubro_Codigo_Desde + "," + " Apu_Rubro_Codigo_Hasta : " + Apu_Rubro_Codigo_Hasta + ","
                        + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + "," + " Apu_Insumo_Nombre : " + Apu_Insumo_Nombre + ","
                        + " Tipo : " + Tipo + "," + " Apu_Subtitulo_Nombre : " + Apu_Subtitulo_Nombre + ","                        
                        + " Apu_Titulo_Nombre : " + Apu_Titulo_Nombre + " Numero_Registros : " + s.Numero_Registros + "," 
                        + " Pagina_Actual : " + s.Pagina_Actual + "," + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Insumo_BySucursal " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_InsumoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Insumo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Rubro_Id,
                        fila.Apu_Insumo_Id,
                        fila.Cantidad,
                        fila.Fecha_Update,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Tipo,
                        fila.Tipo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Apu_Insumo_Codigo,
                        fila.Apu_Insumo_Nombre,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.costo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_Id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo,
                        fila.Costo_Total));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre, string Apu_Insumo_Nombre,
                                string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            int  resultado;
            try
            {
                // Ejecutar el procedimiento en bloque
                resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, s.Int_Sucursal_Id, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta,
                                                      Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre,
                                                      s.Numero_Registros);
            }
            catch (SqlException e)
            {
                throw (e);
            }
            //Retorna el resultado
            return resultado;
        }
        #endregion
        #endregion
    }
}