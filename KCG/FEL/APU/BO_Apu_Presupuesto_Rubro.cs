
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
    /// Tabla: Apu_Presupuesto_Rubro
    /// </summary>
    [DataObject]
    public class BO_Apu_Presupuesto_Rubro
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
        public List<Apu_Presupuesto_Rubro> Get(string sortExpression, Scope s)
        {
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>(Adapter.Apu_Presupuesto_Rubro_Get(s));
            lista.Sort(new Apu_Presupuesto_Rubro_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro> GetByOrigen(string sortExpression, Scope s, string Apu_Origen_Id)
        {
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>(Adapter.Apu_Presupuesto_Rubro_GetByOrigen(s, Apu_Origen_Id));
            lista.Sort(new Apu_Presupuesto_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_GetByOrigen(s, Apu_Origen_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro> GetByPresupuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id,string Estado)
        {
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>(Adapter.Apu_Presupuesto_Rubro_GetByPresupuesto(s, Apu_Presupuesto_Id,Estado));
            lista.Sort(new Apu_Presupuesto_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id, string Estado)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_GetByPresupuesto(s, Apu_Presupuesto_Id,Estado));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro> GetByPresupuestoPF(string sortExpression, Scope s, string Apu_Presupuesto_Id, string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>(Adapter.Apu_Presupuesto_Rubro_GetByPresupuestoPF(s,Apu_Presupuesto_Id,Estado,Apu_Rubro_Codigo,Apu_Rubro_Nombre,Apu_Rubro_Cantidad_Desde,Apu_Rubro_Cantidad_Hasta));
            lista.Sort(new Apu_Presupuesto_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuestoPF(Scope s, string Apu_Presupuesto_Id, string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_GetByPresupuestoPF(s,Apu_Presupuesto_Id,Estado, Apu_Rubro_Codigo,Apu_Rubro_Nombre,Apu_Rubro_Cantidad_Desde,Apu_Rubro_Cantidad_Hasta));
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro> GetByLikePresupuestoPlanilla(string sortExpression, Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre,string Estado,string Fis_Planilla_Id)
        {
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>(Adapter.Apu_Presupuesto_Rubro_GetByLikePresupuestoPlanilla(s, Apu_Presupuesto_Id, Apu_Rubro_Nombre,Estado,Fis_Planilla_Id));
            lista.Sort(new Apu_Presupuesto_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikePresupuestoPlanilla(Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre,string Estado, string Fis_Planilla_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_GetByLikePresupuestoPlanilla(s, Apu_Presupuesto_Id, Apu_Rubro_Nombre,Estado, Fis_Planilla_Id));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Apu_Presupuesto_Id,string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            return Adapter.Apu_Presupuesto_Rubro_TotalPaginas(s, Apu_Presupuesto_Id,Estado, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Cantidad_Desde, Apu_Rubro_Cantidad_Hasta);
        }
        #endregion


        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Presupuesto_Rubro o, Apu_Presupuesto_Rubro original)
        {
            return Adapter.Apu_Presupuesto_Rubro_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro o = new Apu_Presupuesto_Rubro();
            Apu_Presupuesto_Rubro original = new Apu_Presupuesto_Rubro();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Presupuesto_Rubro o)
        {
            return Adapter.Apu_Presupuesto_Rubro_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro o = new Apu_Presupuesto_Rubro();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Presupuesto_Rubro o)
        {
            return Adapter.Apu_Presupuesto_Rubro_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro original = new Apu_Presupuesto_Rubro();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Apu_Presupuesto_Rubro_Comparar : IComparer<Apu_Presupuesto_Rubro>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Presupuesto_Rubro_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Presupuesto_Rubro x, Apu_Presupuesto_Rubro y)
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
