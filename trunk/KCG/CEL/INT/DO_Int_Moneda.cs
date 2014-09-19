
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.InterfaceTableAdapters;
using AEL.INT;
using BEL;

namespace CEL.INT
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Interface 
    /// Tabla:Int_Moneda
    /// </summary>
    public class DO_Int_Moneda
    {
        #region Adapter
        private Int_MonedaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Int_MonedaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Int_MonedaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Int_Moneda
        /// </summary> 
        /// <returns>Lista de objetos Int_Moneda</returns> 
        public List<Int_Moneda> Get(Scope s)
        {
            List<Int_Moneda> lista = new List<Int_Moneda>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_MonedaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Interface.Int_MonedaRow fila in tabla)
                    lista.Add(new Int_Moneda(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Moneda_Id_Ref,
                  fila.Simbolo,
                  fila.Descripcion,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Int_Moneda> GetByCodigo(Scope s, string Codigo)
        {
            List<Int_Moneda> lista = new List<Int_Moneda>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_MonedaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Interface.Int_MonedaRow fila in tabla)
                    lista.Add(new Int_Moneda(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Moneda_Id_Ref,
                  fila.Simbolo,
                  fila.Descripcion,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Int_Moneda> GetById(Scope s, string Id)
        {
            List<Int_Moneda> lista = new List<Int_Moneda>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_MonedaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Interface.Int_MonedaRow fila in tabla)
                    lista.Add(new Int_Moneda(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Moneda_Id_Ref,
                  fila.Simbolo,
                  fila.Descripcion,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Int_Moneda> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Int_Moneda> lista = new List<Int_Moneda>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_MonedaDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, s.Int_Sucursal_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" +
                    " Parametros  Enviados en el Método: " + "," +
                    " s.Ver_Version_Id : " + s.Ver_Version_Id + "," +
                    " Int_Sucursal_Id : " + s.Int_Sucursal_Id + "," +
                    " Nombre : " + Nombre +
                    " Nombre del Store Procedure: " + "dbo.Int_Moneda_ByLikeNombre " +
                    " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_MonedaRow fila in tabla)
                    lista.Add(new Int_Moneda(
                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Moneda_Id_Ref,
                  fila.Simbolo,
                  fila.Descripcion,
                  fila.Estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Int_Moneda
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Int_Moneda o)
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
                      o.Nombre,
                      o.Abreviatura,
                      o.Moneda_Id_Ref,
                      o.Simbolo,
                      o.Descripcion,
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
                            return Insert(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Int_Moneda
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Int_Moneda o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Abreviatura,
                  o.Moneda_Id_Ref,
                  o.Simbolo,
                  o.Descripcion,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Int_Moneda
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Int_Moneda o, Int_Moneda original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Abreviatura,
                  o.Moneda_Id_Ref,
                  o.Simbolo,
                  o.Descripcion,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Abreviatura,
                  original.Moneda_Id_Ref,
                  original.Simbolo,
                  original.Descripcion,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
