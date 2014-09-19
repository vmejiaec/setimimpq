using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;

namespace FEL.APU
{
    /// <summary>
    /// Acceso a los Web Services WS_APU
    /// Modulo: Apu target
    /// Tabla: Apu_Rubro_Documento
    /// </summary>
    [DataObject]
    public class BO_Apu_Rubro_Documento
    {
        #region  Adapter

        private WS_APU _Adapter;

        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_APU Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_APU();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Documento> Get(string sortExpression, Scope s, string par_servidor_Id)
        {
            List<Apu_Rubro_Documento> lista =
                new List<Apu_Rubro_Documento>(Adapter.Apu_Rubro_Documento_Get(s, par_servidor_Id));
            lista.Sort(new Apu_Rubro_Documento_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s, string par_servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Documento_Get(s, par_servidor_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Documento> GetByCodigo(string sortExpression, Scope s, string Codigo,
                                                     string par_servidor_Id)
        {
            List<Apu_Rubro_Documento> lista =
                new List<Apu_Rubro_Documento>(Adapter.Apu_Rubro_Documento_GetByCodigo(s, Codigo, par_servidor_Id));
            lista.Sort(new Apu_Rubro_Documento_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo, string par_servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Documento_GetByCodigo(s, Codigo, par_servidor_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Documento> GetById(string sortExpression, Scope s, string Id, string par_servidor_Id)
        {
            List<Apu_Rubro_Documento> lista =
                new List<Apu_Rubro_Documento>(Adapter.Apu_Rubro_Documento_GetById(s, Id, par_servidor_Id));
            lista.Sort(new Apu_Rubro_Documento_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id, string par_servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Documento_GetById(s, Id, par_servidor_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Documento> GetByRubro(string sortExpression, Scope s, string Apu_Rubro_Id,
                                                    string par_servidor_Id)
        {
            List<Apu_Rubro_Documento> lista =
                new List<Apu_Rubro_Documento>(Adapter.Apu_Rubro_Documento_GetByRubro(s, Apu_Rubro_Id, par_servidor_Id));
            lista.Sort(new Apu_Rubro_Documento_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Documento_GetByRubro(s, Apu_Rubro_Id, par_servidor_Id));
        }

        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Rubro_Documento
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Rubro_Documento o, Apu_Rubro_Documento original)
        {
            return Adapter.Apu_Rubro_Documento_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro_Documento o = new Apu_Rubro_Documento();
            Apu_Rubro_Documento original = new Apu_Rubro_Documento();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Documento
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Rubro_Documento o)
        {
            return Adapter.Apu_Rubro_Documento_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro_Documento o = new Apu_Rubro_Documento();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Rubro_Documento
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Rubro_Documento o)
        {
            return Adapter.Apu_Rubro_Documento_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro_Documento original = new Apu_Rubro_Documento();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Apu_Rubro_Documento_Comparar : IComparer<Apu_Rubro_Documento>
        {
            private bool _reverse;
            private string _sortColumn;

            public Apu_Rubro_Documento_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Apu_Rubro_Documento> Members

            public int Compare(Apu_Rubro_Documento x, Apu_Rubro_Documento y)
            {
                int retVal = 0;
                switch (_sortColumn)
                {
                    case "Id":
                        retVal = string.Compare(x.Id, y.Id);
                        break;
                    case "Nombre":
                        retVal = string.Compare(x.Nombre, y.Nombre);
                        break;
                    case "Codigo":
                        retVal = string.Compare(x.Codigo, y.Codigo);
                        break;
                    case "Estado":
                        retVal = string.Compare(x.Estado, y.Estado);
                        break;
                }
                return (retVal*(_reverse ? -1 : 1));
            }

            #endregion
        }

        #endregion
    }
}