
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Proyecto_Categoria
    /// </summary>
    public class DO_Apu_Proyecto_Categoria
    {
        #region Adapter
        private Apu_Proyecto_CategoriaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Proyecto_CategoriaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Proyecto_CategoriaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Categoria
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Categoria</returns> 
        public List<Apu_Proyecto_Categoria> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Proyecto_Categoria> lista = new List<Apu_Proyecto_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_CategoriaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Proyecto_Categoria_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Categoria(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Proyecto_Id,
                  fila.Apu_Categoria_Id,
                  fila.Costo_Diario,
                  fila.Apu_Proyecto_Codigo,
                  fila.Apu_Proyecto_Nombre,
                  fila.Apu_Proyecto_Etapa,
                  fila.Apu_Categoria_Codigo,
                  fila.Apu_Categoria_Nombre,
                  fila.Int_Empresa_id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Costo_Hora,
                  fila.Int_Moneda_Simbolo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Categoria> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Proyecto_Categoria> lista = new List<Apu_Proyecto_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_CategoriaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Categoria_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Id,
              fila.Apu_Categoria_Id,
              fila.Costo_Diario,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Int_Empresa_id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Costo_Hora,
              fila.Int_Moneda_Simbolo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Categoria> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Categoria> lista = new List<Apu_Proyecto_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_CategoriaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Categoria_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Id,
              fila.Apu_Categoria_Id,
              fila.Costo_Diario,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Int_Empresa_id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Costo_Hora,
              fila.Int_Moneda_Simbolo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Categoria> GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Categoria> lista = new List<Apu_Proyecto_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_CategoriaDataTable tabla =
                Adapter.GetByProyecto(s.Ver_Version_Id, apu_proyecto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_proyecto_Id : " + apu_proyecto_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Categoria_ByProyecto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Id,
              fila.Apu_Categoria_Id,
              fila.Costo_Diario,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Int_Empresa_id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Costo_Hora,
              fila.Int_Moneda_Simbolo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Apu_Proyecto_Categoria> GetByProyectoCategoria(Scope s, string apu_proyecto_Id, string apu_categoria_id)
        {
            string llamada = "";
            List<Apu_Proyecto_Categoria> lista = new List<Apu_Proyecto_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_CategoriaDataTable tabla =
                Adapter.GetByProyectoCat(s.Ver_Version_Id, apu_proyecto_Id, apu_categoria_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_proyecto_Id : " + apu_proyecto_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Categoria_ByProyecto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Id,
              fila.Apu_Categoria_Id,
              fila.Costo_Diario,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Int_Empresa_id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Costo_Hora,
              fila.Int_Moneda_Simbolo,
              fila.Estado_Nombre));
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
        /// Inserta el objeto en la tabla Apu_Proyecto_Categoria
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Proyecto_Categoria o)
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
                      o.Apu_Proyecto_Id,
                      o.Apu_Categoria_Id,
                      o.Costo_Diario,
                      o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
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
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Categoria))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Categoria_ProyCat))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    default:
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Proyecto_Categoria
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Proyecto_Categoria o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Id,
                    o.Apu_Categoria_Id,
                    o.Costo_Diario,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Proyecto_Categoria
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Proyecto_Categoria o, Apu_Proyecto_Categoria original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Id,
                    o.Apu_Categoria_Id,
                    o.Costo_Diario,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Proyecto_Id,
                    original.Apu_Categoria_Id,
                    original.Costo_Diario,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Categoria))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Categoria_ProyCat))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
