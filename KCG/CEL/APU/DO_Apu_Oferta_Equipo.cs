
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
    /// Tabla:Apu_Oferta_Equipo
    /// </summary>
    public class DO_Apu_Oferta_Equipo
    {
        #region Adapter
        private Apu_Oferta_EquipoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Oferta_EquipoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Oferta_EquipoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Oferta_Equipo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Oferta_Equipo</returns> 
        public List<Apu_Oferta_Equipo> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Oferta_Equipo_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Equipo> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Equipo_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Equipo> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Equipo_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Equipo> GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.GetByOferta(s.Ver_Version_Id, Apu_Oferta_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOferta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Oferta_Id : " + Apu_Oferta_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Equipo_ByOferta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Equipo> GetByEquipo(Scope s, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.GetByEquipo(s.Ver_Version_Id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Equipo_ByEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Oferta_Equipo> GetByOfertaEquipo(Scope s, string Apu_Oferta_Id, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Oferta_Equipo> lista = new List<Apu_Oferta_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Oferta_EquipoDataTable tabla =
                Adapter.GetByOfertaEquipo(s.Ver_Version_Id, Apu_Oferta_Id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOfertaEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_oferta_Id : " + Apu_Oferta_Id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Equipo_ByOfertaEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Oferta_EquipoRow fila in tabla)
                    lista.Add(new Apu_Oferta_Equipo(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Oferta_Id,
                        fila.Apu_Equipo_Id,
                        fila.Apu_Oferta_Codigo,
                        fila.Apu_Oferta_Nombre,
                        fila.Apu_Oferta_Etapa,
                        fila.Apu_Equipo_Codigo,
                        fila.Apu_Equipo_Nombre,
                        fila.Costo,
                        fila.Suma_porcentaje_Equipo_Indice,
                        fila.Suma_porcentaje_Equipo_Indice_1,
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
        /// Inserta el objeto en la tabla Apu_Oferta_Equipo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Oferta_Equipo o)
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
                      o.Apu_Equipo_Id,
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
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Equipo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Equipo_Oferta_Equipo))
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
        /// Borra el objeto de la tabla Apu_Oferta_Equipo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Oferta_Equipo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Oferta_Id,
                    o.Apu_Equipo_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Equipo_Indice_Apu_Oferta_Equipo))
                {
                    eCaso = new System.Exception("Apu Oferta Equipo Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Oferta_Equipo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Oferta_Equipo o, Apu_Oferta_Equipo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Oferta_Id,
                    o.Apu_Equipo_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Oferta_Id,
                    original.Apu_Equipo_Id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Equipo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Equipo_Oferta_Equipo))
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
