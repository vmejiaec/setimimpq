
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
    /// Tabla:Apu_Titulo
    /// </summary>
    public class DO_Apu_Titulo
    {
        #region Adapter
        private Apu_TituloTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_TituloTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_TituloTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Titulo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Titulo</returns> 
        public List<Apu_Titulo> Get(Scope s)
        {
            List<Apu_Titulo> lista = new List<Apu_Titulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_TituloDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Apu.Apu_TituloRow fila in tabla)
                    lista.Add(new Apu_Titulo(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Int_Empresa_Id,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Titulo> GetByCodigo(Scope s, string Codigo)
        {
            List<Apu_Titulo> lista = new List<Apu_Titulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_TituloDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Apu.Apu_TituloRow fila in tabla)
                    lista.Add(new Apu_Titulo(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Int_Empresa_Id,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Titulo> GetByEmpresa(Scope s)
        {
            List<Apu_Titulo> lista = new List<Apu_Titulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_TituloDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Carga en la lista
                foreach (Apu.Apu_TituloRow fila in tabla)
                    lista.Add(new Apu_Titulo(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Int_Empresa_Id,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Titulo> GetById(Scope s, string Id)
        {
            List<Apu_Titulo> lista = new List<Apu_Titulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_TituloDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Apu.Apu_TituloRow fila in tabla)
                    lista.Add(new Apu_Titulo(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Int_Empresa_Id,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Titulo> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Apu_Titulo> lista = new List<Apu_Titulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_TituloDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, s.Int_Empresa_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Apu_Titulo_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_TituloRow fila in tabla)
                    lista.Add(new Apu_Titulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
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
        /// Inserta el objeto en la tabla Apu_Titulo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Titulo o)
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Titulo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Titulo_Nombre_Empresa))
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
        /// Borra el objeto de la tabla Apu_Titulo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Titulo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Subtitulo_Apu_Titulo))
                {
                    eCaso = new System.Exception("Apu Subtitulo");
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
        //Actualiza la tabla Apu_Titulo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Titulo o, Apu_Titulo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Int_Empresa_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Int_Empresa_Id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Titulo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Titulo_Nombre_Empresa))
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
