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
    /// Tabla: Apu_Parametros
    /// </summary>
    [DataObject]
    public class BO_Apu_Parametros
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
        public List<Apu_Parametros> Get(string sortExpression, Scope s)
        {
            List<Apu_Parametros> lista = new List<Apu_Parametros>(Adapter.Apu_Parametros_Get(s));
            lista.Sort(new Apu_Parametros_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Parametros_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Parametros> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Apu_Parametros> lista = new List<Apu_Parametros>(Adapter.Apu_Parametros_GetByCodigo(s, Codigo));
            lista.Sort(new Apu_Parametros_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Parametros_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Parametros> GetByEmpresa(string sortExpression, Scope s)
        {
            List<Apu_Parametros> lista = new List<Apu_Parametros>(Adapter.Apu_Parametros_GetByEmpresa(s));
            lista.Sort(new Apu_Parametros_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Parametros_GetByEmpresa(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Parametros> GetById(string sortExpression, Scope s, string Id)
        {
            List<Apu_Parametros> lista = new List<Apu_Parametros>(Adapter.Apu_Parametros_GetById(s, Id));
            lista.Sort(new Apu_Parametros_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Parametros_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Parametros> GetBySucursal(string sortExpression, Scope s)
        {
            List<Apu_Parametros> lista =
                new List<Apu_Parametros>(Adapter.Apu_Parametros_GetBySucursal(s));
            lista.Sort(new Apu_Parametros_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Parametros_GetBySucursal(s));
        }

        #endregion

        #region Procedimientos

        public int ExisteRegistros(Scope s, string p_Int_Sucursal_Id)
        {
            return Adapter.Apu_Parametros_ExisteRegistros(s, s.Int_Sucursal_Id);
        }

        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Parametros
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Parametros o, Apu_Parametros original)
        {
            return Adapter.Apu_Parametros_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Parametros o = new Apu_Parametros();
            Apu_Parametros original = new Apu_Parametros();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Parametros
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Parametros o)
        {
            return Adapter.Apu_Parametros_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Parametros o = new Apu_Parametros();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Parametros
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Parametros o)
        {
            return Adapter.Apu_Parametros_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Parametros original = new Apu_Parametros();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Apu_Parametros_Comparar : IComparer<Apu_Parametros>
        {
            private bool _reverse;
            private string _sortColumn;

            public Apu_Parametros_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Apu_Parametros> Members

            public int Compare(Apu_Parametros x, Apu_Parametros y)
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