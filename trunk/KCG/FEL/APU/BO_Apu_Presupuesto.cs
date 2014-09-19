
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
    /// Tabla: Apu_Presupuesto
    /// </summary>
    [DataObject]
    public class BO_Apu_Presupuesto
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
        public List<Apu_Presupuesto> Get(string sortExpression, Scope s)
        {
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>(Adapter.Apu_Presupuesto_Get(s));
            lista.Sort(new Apu_Presupuesto_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto> GetById(string sortExpression, Scope s, string Id,string Estado)
        {
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>(Adapter.Apu_Presupuesto_GetById(s, Id,Estado));
            lista.Sort(new Apu_Presupuesto_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id,string Estado)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_GetById(s, Id,Estado));
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto> GetByOrigen(string sortExpression, Scope s, string Apu_Origen_Id)
        {
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>(Adapter.Apu_Presupuesto_GetByOrigen(s, Apu_Origen_Id));
            lista.Sort(new Apu_Presupuesto_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_GetByOrigen(s, Apu_Origen_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto> GetByTipoOrigen(string sortExpression, Scope s, string Apu_Tipo_Origen)
        {
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>(Adapter.Apu_Presupuesto_GetByTipoOrigen(s, Apu_Tipo_Origen));
            lista.Sort(new Apu_Presupuesto_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByTipoOrigen(Scope s, string Apu_Tipo_Origen)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_GetByTipoOrigen(s, Apu_Tipo_Origen));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto> GetBySucursal(string sortExpression, Scope s)
        {
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>(Adapter.Apu_Presupuesto_GetBySucursal(s));
            lista.Sort(new Apu_Presupuesto_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_GetBySucursal(s));
        }
          


        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Presupuesto
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Presupuesto o, Apu_Presupuesto original)
        {
            return Adapter.Apu_Presupuesto_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto o = new Apu_Presupuesto();
            Apu_Presupuesto original = new Apu_Presupuesto();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Presupuesto o)
        {
            return Adapter.Apu_Presupuesto_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto o = new Apu_Presupuesto();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Presupuesto
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Presupuesto o)
        {
            return Adapter.Apu_Presupuesto_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto original = new Apu_Presupuesto();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Apu_Presupuesto_Comparar : IComparer<Apu_Presupuesto>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Presupuesto_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Presupuesto x, Apu_Presupuesto y)
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
