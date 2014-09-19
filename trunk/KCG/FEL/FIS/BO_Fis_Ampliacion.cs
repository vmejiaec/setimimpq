
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.FIS
{
    /// <summary>
    /// Acceso a los Web Services WS_FIS
    /// Modulo: Fiscalizaci
    /// Tabla: Fis_Ampliacion
    /// </summary>
    [DataObject]
    public class BO_Fis_Ampliacion
    {
        #region  Adapter
        private WS_FIS _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_FIS Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_FIS();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Ampliacion> Get(string sortExpression, Scope s)
        {
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>(Adapter.Fis_Ampliacion_Get(s));
            lista.Sort(new Fis_Ampliacion_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Ampliacion_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Ampliacion> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>(Adapter.Fis_Ampliacion_GetByCodigo(s, Codigo));
            lista.Sort(new Fis_Ampliacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Fis_Ampliacion_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Ampliacion> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>(Adapter.Fis_Ampliacion_GetById(s, Id));
            lista.Sort(new Fis_Ampliacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Ampliacion_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Ampliacion> GetByPresuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>(Adapter.Fis_Ampliacion_GetByPresuesto(s, Apu_Presupuesto_Id));
            lista.Sort(new Fis_Ampliacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Ampliacion_GetByPresuesto(s, Apu_Presupuesto_Id));
        }
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Ampliacion
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Ampliacion o, Fis_Ampliacion original)
        {
            return Adapter.Fis_Ampliacion_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Ampliacion o = new Fis_Ampliacion();
            Fis_Ampliacion original = new Fis_Ampliacion();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Fis_Ampliacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Fis_Ampliacion o)
        {
            return Adapter.Fis_Ampliacion_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Ampliacion o = new Fis_Ampliacion();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Fis_Ampliacion
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Fis_Ampliacion o)
        {
            return Adapter.Fis_Ampliacion_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Ampliacion original = new Fis_Ampliacion();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Fis_Ampliacion_Comparar : IComparer<Fis_Ampliacion>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Ampliacion_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Ampliacion x, Fis_Ampliacion y)
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
                return (retVal * (_reverse ? -1 : 1));
            }
        }
        #endregion
    }
}