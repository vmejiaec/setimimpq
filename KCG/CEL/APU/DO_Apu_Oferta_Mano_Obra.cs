
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
    /// Tabla:Apu_Oferta_Mano_Obra
    /// </summary>
    public class DO_Apu_Oferta_Mano_Obra
    {
        #region Adapter
        private Apu_Oferta_Mano_ObraTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Oferta_Mano_ObraTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Oferta_Mano_ObraTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Oferta_Mano_Obra
        /// </summary> 
        /// <returns>Lista de objetos Apu_Oferta_Mano_Obra</returns> 
        public List<Apu_Oferta_Mano_Obra> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Oferta_Mano_Obra_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Oferta_Id,
                  fila.Apu_Mano_Obra_Id,
                  fila.Apu_Categoria_Id,
                  fila.Apu_Indice_Id,
                  fila.Costo_Diario,
                  fila.Apu_Oferta_Codigo,
                  fila.Apu_Oferta_Nombre,
                  fila.Apu_Oferta_Etapa,
                  fila.Apu_Mano_Obra_Codigo,
                  fila.Apu_Mano_Obra_Nombre,
                  fila.Apu_Categoria_Codigo,
                  fila.Apu_Categoria_Nombre,
                  fila.Apu_Indice_Codigo,
                  fila.Apu_Indice_Nombre,
                  fila.Costo,
                  fila.Int_Moneda_Simbolo,
                  fila.Estado_Nombre,
                  fila.Apu_Mano_Obra_Costo_Diario,
                  fila.Costo_Hora,
                  fila.Cantidad_Mano_Obra,
                  fila.Cantidad_Mano_Obra_X_Costo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Mano_Obra> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Mano_Obra_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(
                      fila.Id,
                      fila.Codigo,
                      fila.Estado,
                      fila.Apu_Oferta_Id,
                      fila.Apu_Mano_Obra_Id,
                      fila.Apu_Categoria_Id,
                      fila.Apu_Indice_Id,
                      fila.Costo_Diario,
                      fila.Apu_Oferta_Codigo,
                      fila.Apu_Oferta_Nombre,
                      fila.Apu_Oferta_Etapa,
                      fila.Apu_Mano_Obra_Codigo,
                      fila.Apu_Mano_Obra_Nombre,
                      fila.Apu_Categoria_Codigo,
                      fila.Apu_Categoria_Nombre,
                      fila.Apu_Indice_Codigo,
                      fila.Apu_Indice_Nombre,
                      fila.Costo,
                      fila.Int_Moneda_Simbolo,
                      fila.Estado_Nombre,
                    fila.Apu_Mano_Obra_Costo_Diario,
                    fila.Costo_Hora,
                    fila.Cantidad_Mano_Obra,
                    fila.Cantidad_Mano_Obra_X_Costo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Mano_Obra> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Mano_Obra_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(

                              fila.Id,
                              fila.Codigo,
                              fila.Estado,
                              fila.Apu_Oferta_Id,
                              fila.Apu_Mano_Obra_Id,
                              fila.Apu_Categoria_Id,
                              fila.Apu_Indice_Id,
                              fila.Costo_Diario,
                              fila.Apu_Oferta_Codigo,
                              fila.Apu_Oferta_Nombre,
                              fila.Apu_Oferta_Etapa,
                              fila.Apu_Mano_Obra_Codigo,
                              fila.Apu_Mano_Obra_Nombre,
                              fila.Apu_Categoria_Codigo,
                              fila.Apu_Categoria_Nombre,
                              fila.Apu_Indice_Codigo,
                              fila.Apu_Indice_Nombre,
                              fila.Costo,
                              fila.Int_Moneda_Simbolo,
                              fila.Estado_Nombre,
                             fila.Apu_Mano_Obra_Costo_Diario,
                            fila.Costo_Hora,
                            fila.Cantidad_Mano_Obra,
                            fila.Cantidad_Mano_Obra_X_Costo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Mano_Obra> GetByManoObra(Scope s, string Apu_Mano_Obra_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.GetByManoObra(s.Ver_Version_Id, Apu_Mano_Obra_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByManoObra" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Mano_Obra_Id : " + Apu_Mano_Obra_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Mano_Obra_ByManoObra " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(
                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Oferta_Id,
                  fila.Apu_Mano_Obra_Id,
                  fila.Apu_Categoria_Id,
                  fila.Apu_Indice_Id,
                  fila.Costo_Diario,
                  fila.Apu_Oferta_Codigo,
                  fila.Apu_Oferta_Nombre,
                  fila.Apu_Oferta_Etapa,
                  fila.Apu_Mano_Obra_Codigo,
                  fila.Apu_Mano_Obra_Nombre,
                  fila.Apu_Categoria_Codigo,
                  fila.Apu_Categoria_Nombre,
                  fila.Apu_Indice_Codigo,
                  fila.Apu_Indice_Nombre,
                  fila.Costo,
                  fila.Int_Moneda_Simbolo,
                  fila.Estado_Nombre,
                    fila.Apu_Mano_Obra_Costo_Diario,
                    fila.Costo_Hora,
                    fila.Cantidad_Mano_Obra,
                    fila.Cantidad_Mano_Obra_X_Costo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Mano_Obra> GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.GetByOferta(s.Ver_Version_Id, Apu_Oferta_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOferta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Oferta_Id : " + Apu_Oferta_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Mano_Obra_ByOferta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(
                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Oferta_Id,
                  fila.Apu_Mano_Obra_Id,
                  fila.Apu_Categoria_Id,
                  fila.Apu_Indice_Id,
                  fila.Costo_Diario,
                  fila.Apu_Oferta_Codigo,
                  fila.Apu_Oferta_Nombre,
                  fila.Apu_Oferta_Etapa,
                  fila.Apu_Mano_Obra_Codigo,
                  fila.Apu_Mano_Obra_Nombre,
                  fila.Apu_Categoria_Codigo,
                  fila.Apu_Categoria_Nombre,
                  fila.Apu_Indice_Codigo,
                  fila.Apu_Indice_Nombre,
                  fila.Costo,
                  fila.Int_Moneda_Simbolo,
                  fila.Estado_Nombre,
                  fila.Apu_Mano_Obra_Costo_Diario,
                fila.Costo_Hora,
                fila.Cantidad_Mano_Obra,
                fila.Cantidad_Mano_Obra_X_Costo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Mano_Obra> GetByOfertaManoObra(Scope s, string Apu_Oferta_Id, string Apu_Mano_Obra_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Mano_Obra> lista = new List<Apu_Oferta_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_Mano_ObraDataTable tabla =
                Adapter.GetByOfertaManoObra(s.Ver_Version_Id, Apu_Oferta_Id, Apu_Mano_Obra_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOfertaManoObra" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_oferta_id : " + Apu_Oferta_Id + "," + " Apu_Mano_Obra_Id : " + Apu_Mano_Obra_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Mano_Obra_ByOfertaManoObra " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Oferta_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Indice_Id,
                        fila.Costo_Diario,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Indice_Codigo,
                        fila.Apu_Indice_Nombre,
                        fila.Costo,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre,
                        fila.Apu_Mano_Obra_Costo_Diario,
                        fila.Costo_Hora,
                        fila.Cantidad_Mano_Obra,
                        fila.Cantidad_Mano_Obra_X_Costo));
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
        /// Inserta el objeto en la tabla Apu_Oferta_Mano_Obra
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Oferta_Mano_Obra o)
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
                      o.Apu_Oferta_Id,
                      o.Apu_Mano_Obra_Id,
                      o.Apu_Categoria_Id,
                      o.Apu_Indice_Id,
                      o.Estado,
                      o.Costo_Diario);
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
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Mano_Obra))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
        /// Borra el objeto de la tabla Apu_Oferta_Mano_Obra
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Oferta_Mano_Obra o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Oferta_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Apu_Categoria_Id,
                    o.Apu_Indice_Id,
                    o.Estado,
                    o.Costo_Diario);
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
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Oferta_Mano_Obra
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Oferta_Mano_Obra o, Apu_Oferta_Mano_Obra original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Oferta_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Apu_Categoria_Id,
                    o.Apu_Indice_Id,
                    o.Estado,
                    o.Costo_Diario,
                    original.Id,
                    original.Codigo,
                    original.Apu_Oferta_Id,
                    original.Apu_Mano_Obra_Id,
                    original.Apu_Categoria_Id,
                    original.Apu_Indice_Id,
                    original.Estado,
                    original.Costo_Diario);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Mano_Obra))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
