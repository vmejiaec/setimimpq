
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
    /// Tabla:Apu_Indice
    /// </summary>
    public class DO_Apu_Indice
    {
        #region Adapter
        private Apu_IndiceTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_IndiceTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_IndiceTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Indice
        /// </summary> 
        /// <returns>Lista de objetos Apu_Indice</returns> 
        public List<Apu_Indice> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Indice_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Int_Empresa_Id,
                  fila.Varios,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Varios_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        #region  Procedimiento de SELECT  UNI  ExisteRegistros
        public int ExisteRegistros(Scope s)
        {
            int resultado;
            // Recuperar la lista de objetos a procesar
            List<Apu_Indice> lista = null;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.ExisteRegistros(s.Int_Empresa_Id);
            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = "ExisteRegistros.Ver_Version_Id: " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + "Nombre del SP: " + " dbo.Apu_Indice_existeRegistros " + "," + " resultado: " + resultado;
            // Registrar la auditoria del procedimiento
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_UNI);
            //Retorna el resultado
            return resultado;
        }
        #endregion
        public List<Apu_Indice> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Indice> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Indice> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Indice> GetBySoloMaterial(Scope s)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetBySoloMaterial(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySoloMaterial" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " int_empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Indice_BySoloMaterial " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Indice> GetByVariosN(Scope s)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetByVariosN(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByVariosN" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ByVariosN " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Indice> GetByLikeSoloMaterial(Scope s, string nombre)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetByLikeSoloMaterial(s.Ver_Version_Id, nombre, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeSoloMaterial" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + nombre + "," + " int_empresa_Id : " + nombre + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ByLikeSoloMaterial " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Varios,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Varios_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }


        public List<Apu_Indice> GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Indice_Nombre)
        {
            string llamada = "";
            List<Apu_Indice> lista = new List<Apu_Indice>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_IndiceDataTable tabla =
                Adapter.GetByLikeNombreCatalogo(s.Ver_Version_Id, Fis_Catalogo_Id, Apu_Indice_Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombreCatalogo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id + "," + " Apu_Indice_Nombre : " + Apu_Indice_Nombre + " Nombre del Store Procedure: " + "dbo.Apu_Indice_ByLikeNombreCatalogo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_IndiceRow fila in tabla)
                    lista.Add(new Apu_Indice(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Int_Empresa_Id,
                              fila.Varios,
                              fila.Int_empresa_Codigo,
                              fila.Int_Empresa_nombre,
                              fila.Varios_Nombre,
                              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        #region  Procedimiento Update de UpdateVariosN
        public int UpdateVariosN(Scope s)
        {
            int resultado;
            // Recuperar la lista de objetos a procesar
            List<Apu_Indice> lista = GetByVariosN(s);
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.UpdateVariosN(s.Int_Empresa_Id);
            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = "GetbyVariosN.Ver_Version_Id: " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + "Nombre del SP: " + " dbo.Apu_Indice_UpdateVariosN " + "," + "resultado: " + resultado;
            // Registrar la auditoria del procedimiento
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_BLOQUE_UPDATE);
            //Retorna el resultado
            return resultado;
        }
        #endregion
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Indice
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Indice o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Nombre.ToUpper(),
                      o.Int_Empresa_Id,
                      o.Varios.ToUpper(),
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_nombre_Empresa_Id))
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
        /// Borra el objeto de la tabla Apu_Indice
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Indice o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Varios,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Equipo_Indice_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Oferta Equipo Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Material_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Oferta Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Transporte_Indice_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Oferta Transporte Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Parametros_Apu_Indice_Equipo))
                {
                    eCaso = new System.Exception("Apu Parametros");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Mano_Obra_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Oferta Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Equipo_Indice_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Proyecto Equipo Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Transporte_Indice_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Proyecto Transporte Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Indice_Equipo_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Indice Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Mano_Obra_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Proyecto Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Material_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Proyecto Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_Indice_Apu_Indi))
                {
                    eCaso = new System.Exception("Fis Catalogo Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Formula_Apu_Indice))
                {
                    eCaso = new System.Exception("Apu Presupuesto Formula");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Indice
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Indice o, Apu_Indice original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Int_Empresa_Id,
                    o.Varios,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Int_Empresa_Id,
                    original.Varios,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_nombre_Empresa_Id))
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
