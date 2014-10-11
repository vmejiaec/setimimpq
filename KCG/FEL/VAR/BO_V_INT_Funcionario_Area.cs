using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace FEL.VAR
{
    [DataObject]
    public class BO_V_INT_Funcionario_Area
    {
        #region Adaptador
        private WS_VAR _Adapter;
        public WS_VAR Adapter
        {
            get
            {
                if (_Adapter == null) _Adapter = new WS_VAR();
                return _Adapter;
            }
        }
        #endregion
        #region Select
        // Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Funcionario_Area> Get(Scope s)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>(
                Adapter.V_INT_Funcionario_Area_Get(s));
            return lista;
        }
        // Select los funcionarios que faltan en el sistema
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Funcionario_Area> GetByFaltanEnRazonSocial(Scope s)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>(
                Adapter.V_INT_Funcionario_Area_GetByFaltanEnRazonSocial(s));
            return lista;
        }
        // Select un funcionario por codigo
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Funcionario_Area> GetByPersona_Codigo(Scope s, string p_Persona_Codigo)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>(
                Adapter.V_INT_Funcionario_Area_GetByPersona_Codigo(s,p_Persona_Codigo));
            return lista;
        }
        // Select Funcionarios por Nombres parecidos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Funcionario_Area> GetByLikePersona_Nombre(Scope s, string p_Persona_Nombre)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>(
                Adapter.V_INT_Funcionario_Area_GetByLikePersona_Nombre(s, p_Persona_Nombre));
            return lista;
        }
        // Inserta un funcionario que no está presente en el sistema
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, V_INT_Funcionario_Area n)
        {
            return Adapter.V_INT_Funcionario_Area_Insert(s, n);
            
        }
        #endregion
    }
}
