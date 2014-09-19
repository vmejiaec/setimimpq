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
    /// Tabla: Apu_Categoria
    /// </summary>
    [DataObject]
    public class BO_Apu_Categoria
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
        public List<Apu_Categoria> Get(string sortExpression, Scope s)
        {
            List<Apu_Categoria> lista = new List<Apu_Categoria>(Adapter.Apu_Categoria_Get(s));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Categoria> GetByCodigo(string sortExpression, Scope s, string codigo, string Int_Sucursal_Id)
        {
            List<Apu_Categoria> lista =
                new List<Apu_Categoria>(Adapter.Apu_Categoria_GetByCodigo(s, codigo, s.Int_Sucursal_Id));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string codigo, string Int_Sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_GetByCodigo(s, codigo, s.Int_Sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Categoria> GetByEmpresa(string sortExpression, Scope s, string Int_Sucursal_Id)
        {
            List<Apu_Categoria> lista = new List<Apu_Categoria>(Adapter.Apu_Categoria_GetByEmpresa(s, s.Int_Sucursal_Id));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s, string Int_Sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_GetByEmpresa(s, s.Int_Sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Categoria> GetById(string sortExpression, Scope s, string Id, string Int_Sucursal_Id)
        {
            List<Apu_Categoria> lista = new List<Apu_Categoria>(Adapter.Apu_Categoria_GetById(s, Id, s.Int_Sucursal_Id));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id, string Int_Sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_GetById(s, Id, s.Int_Sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Categoria> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Apu_Categoria> lista = new List<Apu_Categoria>(Adapter.Apu_Categoria_GetByLikeNombre(s, Nombre));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_GetByLikeNombre(s, Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Categoria> GetByLikeNombreCatalogo(string sortExpression, Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Nombre)
        {
            List<Apu_Categoria> lista = new List<Apu_Categoria>(Adapter.Apu_Categoria_GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Nombre));
            lista.Sort(new Apu_Categoria_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Nombre)
        {
            return EntidadDT.GetDT(Adapter.Apu_Categoria_GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Nombre));
        }

        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Categoria
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Categoria o, Apu_Categoria original)
        {
            return Adapter.Apu_Categoria_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Categoria o = new Apu_Categoria();
            Apu_Categoria original = new Apu_Categoria();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Categoria o)
        {
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            return Adapter.Apu_Categoria_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Categoria o = new Apu_Categoria();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Categoria
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Categoria o)
        {
            return Adapter.Apu_Categoria_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Categoria original = new Apu_Categoria();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Apu_Categoria_Comparar : IComparer<Apu_Categoria>
        {
            private bool _reverse;
            private string _sortColumn;

            public Apu_Categoria_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Apu_Categoria> Members

            public int Compare(Apu_Categoria x, Apu_Categoria y)
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