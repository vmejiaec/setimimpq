using System.Collections.Generic;
using AEL.APR;
using AEL.AUD;
using AEL.DIC;
using AEL.INT;
using AEL.PAR;
using AEL.VER;
using BEL;
using CEL.APR;
using CEL.AUD;
using CEL.DIC;
using CEL.INT;
using CEL.PAR;
using CEL.VER;

namespace META
{
    public class Meta
    {
        // Función  para el mantenimiento  de DIC_PAR_MANTENIMIENTO_PAR_PAGINACION
        public static int DIC_MANTENIMIENTO_PAR_PAGINACION(Scope s)
        {
            DO_Par_Servidor boParServidor = new DO_Par_Servidor();
            List<Par_Servidor> listParServidor = boParServidor.Get(s);

            DO_Dic_Objeto boDicObjeto = new DO_Dic_Objeto();
            List<Dic_Objeto> listDicObjeto = boDicObjeto.GetByMantenimiento1(s);

            if (listParServidor.Count == 0 || listDicObjeto.Count == 0)
                return 0;

            DO_Dic_Par_Paginacion boDicParPaginacion = new DO_Dic_Par_Paginacion();

            int registrosInsertados = 0;

            for (int iParServidor = 0; iParServidor < listParServidor.Count; iParServidor++)
            {
                for (int iDicObjeto = 0; iDicObjeto < listDicObjeto.Count; iDicObjeto++)
                {
                    Dic_Par_Paginacion itemParPaginacion = new Dic_Par_Paginacion();
                    itemParPaginacion.Par_Servidor_Id = listParServidor[iParServidor].Id;
                    itemParPaginacion.Dic_Objeto_Id = listDicObjeto[iDicObjeto].Id;
                    itemParPaginacion.Limite_registros = 1000;
                    itemParPaginacion.Numero_usuarios = 1;
                    itemParPaginacion.Umbral = 200;

                    try
                    {
                        boDicParPaginacion.Insert(s, itemParPaginacion);
                        registrosInsertados++;
                    }
                    catch
                    {
                        ////Auditar.Registro(s, itemParPaginacion, Textos._AUDITAR_ACCION_INSERT);

                        //Audutar el error y cotinuar

                        continue;


                        /*DO_Aud_Log boAudLog = new DO_Aud_Log();
                        Aud_Log itemAudLog = new Aud_Log();
                        itemAudLog.Fecha = DateTime.Now;
                        
                        boAudLog.Insert(s, itemAudLog);*/
                    }
                }
            }

            return registrosInsertados;
        }

        //Función para el mantenimiento  de PAR_MENSAJE
        public static int PAR_MANTENIMIENTO_MENSAJE(Scope s)
        {
            DO_Par_Mensaje boParMensaje = new DO_Par_Mensaje();
            DO_Ver_Version version = new DO_Ver_Version();
            DO_Ver_Mensaje listaInsertaVermensaje = new DO_Ver_Mensaje();

            List<Ver_Version> listaVersion = new List<Ver_Version>();
            List<Par_Mensaje> lista = boParMensaje.GetByMantenimiento(s);

            if (lista.Count == 0 || lista.Count == 0)
                return 0;
            int registrosInsertados = 0;
            for (int j = 0; j < listaVersion.Count; j++)
            {
                for (int i = 0; i < lista.Count; i++)
                {
                    Ver_Mensaje o = new Ver_Mensaje();
                    o.Nombre = lista[i].Nombre;
                    o.Ver_Version_Id = s.Ver_Version_Id;
                    o.Par_Mensaje_Id = lista[i].Id;
                    try
                    {
                        listaInsertaVermensaje.Insert(s, o);
                        registrosInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return registrosInsertados;
        }

        //Función para el mantenimiento  de APR_DOC_ESTADO
        public static int APR_MANTENIMIENTO_DOC_ESTADO(Scope s)
        {
            DO_Ver_Version version = new DO_Ver_Version();
            List<Ver_Version> listaVersion = version.Get(s);
            DO_Apr_Doc_Estado aprDocEstado = new DO_Apr_Doc_Estado();
            List<Apr_Doc_Estado> listaAprDocEstado = new List<Apr_Doc_Estado>();
            listaAprDocEstado = aprDocEstado.GetByMantenimiento(s, s.Ver_Version_Id);
            DO_Ver_Doc_Estado InsertaRegistros = new DO_Ver_Doc_Estado();
            int registrosInsertados = 0;
            if (listaVersion.Count == 0 || listaAprDocEstado.Count == 0)
                return 0;
            for (int i = 0; i < listaVersion.Count; i++)
            {
                for (int j = 0; j < listaAprDocEstado.Count; j++)
                {
                    Ver_Doc_Estado o = new Ver_Doc_Estado();
                    o.Ver_Version_Id = s.Ver_Version_Id;
                    o.Nombre = listaAprDocEstado[j].Nombre;
                    o.Apr_Doc_Estado_Id = listaAprDocEstado[j].Id;
                    try
                    {
                        InsertaRegistros.Insert(s, o);
                        registrosInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return registrosInsertados;
        }

        //Función para el mantenimiento  de APR_DOC_ESTADO
        public static int APR_MANTENIMIENTO_DOCUMENTO(Scope s)
        {
            DO_Ver_Version version = new DO_Ver_Version();
            List<Ver_Version> listaVersion = version.Get(s);
            DO_Apr_Documento aprDocEstado = new DO_Apr_Documento();
            List<Apr_Documento> listaAprDocEstado = new List<Apr_Documento>();
            listaAprDocEstado = aprDocEstado.GetByMantenimiento(s, s.Ver_Version_Id);
            DO_Ver_Documento InsertaRegistros = new DO_Ver_Documento();
            int registrosInsertados = 0;
            if (listaVersion.Count == 0 || listaAprDocEstado.Count == 0)
                return 0;
            for (int i = 0; i < listaVersion.Count; i++)
            {
                for (int j = 0; j < listaAprDocEstado.Count; j++)
                {
                    Ver_Documento o = new Ver_Documento();
                    o.Ver_Version_id = s.Ver_Version_Id;
                    o.Nombre = listaAprDocEstado[j].Nombre;
                    o.Apr_Documento_Id = listaAprDocEstado[j].Id;
                    try
                    {
                        InsertaRegistros.Insert(s, o);
                        registrosInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return registrosInsertados;
        }

        //Función  para el mantenimiento de DIC_DOMINIO
        public static int DIC_MANTENIMIENTO_DOMINIO(Scope s)
        {
            DO_Ver_Version version = new DO_Ver_Version();
            DO_Dic_Dominio dominio = new DO_Dic_Dominio();
            DO_Ver_Dominio verdominio = new DO_Ver_Dominio();
            List<Ver_Version> listVersion = version.Get(s);
            List<Dic_Dominio> listDominio = dominio.GetByMantenimiento(s);
            int registrosInsertados = 0;
            if (listVersion.Count == 0 || listDominio.Count == 0)
                return 0;
            for (int i = 0; i < listVersion.Count; i++)
            {
                for (int j = 0; j < listDominio.Count; j++)
                {
                    Ver_Dominio o = new Ver_Dominio();
                    o.Nombre = listDominio[j].Nombre;
                    o.Dic_Dominio_id = listDominio[j].Id;
                    o.Ver_Version_id =listVersion[i].Id;
                    try
                    {
                        verdominio.Insert(s, o);
                        registrosInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return registrosInsertados;
        }

        //Función para el mantenimiento de DIC_ROTULO
        public static int DIC_MANTENIMIENTO_ROTULO(Scope s)
        {
            DO_Ver_Version version = new DO_Ver_Version();
            List<Ver_Version> listVersion = version.Get(s);
            DO_Dic_Rotulo Rotulo = new DO_Dic_Rotulo();
            List<Dic_Rotulo> listRotulo = Rotulo.GetByMantenimiento(s);
            DO_Ver_Etiqueta verEtiqueta = new DO_Ver_Etiqueta();
            int registrosInsertados = 0;
            if (listVersion.Count == 0 || listRotulo.Count == 0)
                return 0;
            for (int i = 0; i < listVersion.Count; i++)
            {
                for (int j = 0; j < listRotulo.Count; j++)
                {
                    Ver_Etiqueta o = new Ver_Etiqueta();
                    o.Nombre = listRotulo[j].Nombre;
                    o.Dic_Rotulo_Id = listRotulo[j].Id;
                    o.Ver_Version_Id = listVersion[i].Id;
                    try
                    {
                        verEtiqueta.Insert(s, o);
                        registrosInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return registrosInsertados;
        }

        //Función  para el  mantenimiento de AUD_MANTENIMIENTO_PAR_AUDITORIA
        public static int AUD_MANTENIMIENTO_PAR_AUDITORIA(Scope s)
        {
            DO_Int_Sucursal sucursal = new DO_Int_Sucursal();
            List<Int_Sucursal> listaSucursal;
            listaSucursal = sucursal.GetByEmpresa(s, s.Int_Empresa_Id);
            DO_Dic_Objeto objeto = new DO_Dic_Objeto();
            List<Dic_Objeto> listaObjeto;
            listaObjeto = objeto.GetByMantenimiento(s,s.Int_Empresa_Id);
            DO_Aud_Par_Auditoria registroInsertado = new DO_Aud_Par_Auditoria();
            int numeroRegistroInsertados = 0;
            if (listaObjeto.Count == 0 || listaSucursal.Count == 0)
                return 0;
            for (int i = 0; i < listaSucursal.Count; i++)
            {
                for (int j = 0; j < listaObjeto.Count; j++)
                {
                    Aud_Par_Auditoria registro = new Aud_Par_Auditoria();
                    registro.Int_Sucursal_Id = listaSucursal[i].Id;
                    registro.Dic_Objeto_Id = listaObjeto[j].Id;
                    if (listaObjeto[j].Dic_Modulo_Codigo.ToString() == "AUD")
                    {
                        registro.INS = "N";
                        registro.DEL = "N";
                        registro.UPD = "N";
                        registro.BIN = "N";
                        registro.BUP = "N";
                        registro.BDE = "N";
                        registro.SEL = "N";
                        registro.UNI = "N";
                    }
                    else
                    {
                        registro.INS = "S";
                        registro.DEL = "S";
                        registro.UPD = "S";
                        registro.BIN = "S";
                        registro.BUP = "S";
                        registro.BDE = "S";
                        registro.SEL = "S";
                        registro.UNI = "S";
                    }
                    try
                    {
                        registroInsertado.Insert(s, registro);
                        numeroRegistroInsertados++;
                    }
                    catch
                    {
                        continue;
                    }
                }
            }

            return numeroRegistroInsertados;
        }

        //Función  para el mantenimiento de VER_VERSION
        public static int VER_MANTENIMIENTO_VERSION(Scope s)
        {
            DO_Ver_Version version = new DO_Ver_Version();
            List<Ver_Version> listaVersion;
            listaVersion = version.GetByMantenimiento(s);
            int numeroRegistrosInsertados = 0;
            int numeroRegistrosDocumento = 0;
            int numeroRegistrosAprDocEstado = 0;
            int numeroRegistrosParMensaje = 0;
            int numeroRegistrosDicDominio = 0;
            DO_Ver_Documento insercionDocumento=new DO_Ver_Documento();
            for (int i = 0; i < listaVersion.Count; i++)
            {
                //Primer bucle es para barrerse todos los registros  de APR_DOCUMENTO
                DO_Apr_Documento aprDocumento= new DO_Apr_Documento();
                List<Apr_Documento> listaAprDocumento;
                DO_Ver_Documento registroInsVerDocumento=new DO_Ver_Documento();
                listaAprDocumento = aprDocumento.Get(s);
                for(int j=0;j < listaAprDocumento.Count;j++)
                {
                    Ver_Documento registroDocumento=new Ver_Documento();
                    registroDocumento.Nombre = listaAprDocumento[j].Nombre;
                    registroDocumento.Apr_Documento_Id = listaAprDocumento[j].Id;
                    registroDocumento.Ver_Version_id = listaVersion[i].Id;
                    try
                    {
                        registroInsVerDocumento.Insert(s, registroDocumento);
                        numeroRegistrosDocumento++;
                    }
                    catch
                    {
                        continue;
                    }
                }
                //Segundo Bucle  es para barrerse todos los registros de APR_DOC_ESTADO
                DO_Apr_Doc_Estado aprDocEstado=new DO_Apr_Doc_Estado();
                List<Apr_Doc_Estado> listaAprDocEstado;
                listaAprDocEstado = aprDocEstado.Get(s);
                
                DO_Ver_Doc_Estado registroInsVerDocEstado=new DO_Ver_Doc_Estado();

                for(int k=0;k<listaAprDocEstado.Count;k++)
                {
                    Ver_Doc_Estado  registroVerDocEstado=new Ver_Doc_Estado();
                    registroVerDocEstado.Nombre = listaAprDocEstado[k].Nombre;
                    registroVerDocEstado.Ver_Version_Id = listaVersion[i].Id;
                    registroVerDocEstado.Apr_Doc_Estado_Id = listaAprDocEstado[k].Id;
                    try
                    {
                        registroInsVerDocEstado.Insert(s, registroVerDocEstado);
                        numeroRegistrosAprDocEstado++;
                    }
                    catch
                    {
                        continue;
                    }

                    
                }
                //Tercer Bucle  es para barrerse todos los registros de PAR_MENSAJE
                DO_Par_Mensaje mensaje=new DO_Par_Mensaje();
                List<Par_Mensaje> listaParMensaje;
                DO_Ver_Mensaje registroInsParMensaje=new DO_Ver_Mensaje();
                listaParMensaje = mensaje.Get(s);
               
                for(int  l=0;l<listaParMensaje.Count;l++)
                {
                    Ver_Mensaje regitroVerMensaje=new Ver_Mensaje();
                    regitroVerMensaje.Ver_Version_Id = listaVersion[i].Id;
                    regitroVerMensaje.Par_Mensaje_Id = listaParMensaje[l].Id;
                    regitroVerMensaje.Nombre = listaParMensaje[l].Nombre;

                    try
                    {
                        registroInsParMensaje.Insert(s, regitroVerMensaje);
                        numeroRegistrosParMensaje++;
                    }
                    catch
                    {
                        continue;
                    }
                }
                //Cuarto  Bucle  es para barrerse todos los registros de DIC_DOMINIO
                DO_Dic_Dominio dominio=new DO_Dic_Dominio();
                List<Dic_Dominio> listaDominio=new List<Dic_Dominio>();
                DO_Ver_Dominio registrosInsVerDominio=new DO_Ver_Dominio();
                listaDominio = dominio.Get(s);
               
                for (int m = 0; m < listaDominio.Count; m++)

                {
                    Ver_Dominio registroverDominio=new Ver_Dominio();
                    registroverDominio.Nombre = listaDominio[m].Nombre;
                    registroverDominio.Ver_Version_id = listaVersion[i].Id;
                    registroverDominio.Dic_Dominio_id = listaDominio[m].Id;
                    try
                    {
                        registrosInsVerDominio.Insert(s, registroverDominio);
                        numeroRegistrosDicDominio++; 
                    }
                    catch
                    {
                        continue;
                    }
                }
            }
            return numeroRegistrosInsertados=numeroRegistrosDocumento+numeroRegistrosAprDocEstado+numeroRegistrosParMensaje+numeroRegistrosDicDominio;
        }

        //Función  Ver_Version
        public  static  string  VER_VERSION_EXISTE_REGISTROS(Scope s,string versionPredeterminada )
        { 
            DO_Ver_Version version=new DO_Ver_Version();
            int numeroRegistros = version.ExisteRegistros(s);
            string RetornarValor = "";
            if(versionPredeterminada=="N" && numeroRegistros==0)
            {
                RetornarValor = "S";
            }
            else
            {
                
                RetornarValor = "N";
            }
            return RetornarValor;

            
        }



        
    }
}