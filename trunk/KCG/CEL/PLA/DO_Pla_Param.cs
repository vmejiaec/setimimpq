using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Param
    {
	// adapter
    public Pla_ParamTableAdapter Adapter = new Pla_ParamTableAdapter();
	//Select
	public List<Pla_Param> Get(Scope s)
    {
        List<Pla_Param> lista = new List<Pla_Param>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Param(
				fila.Id,
fila.Rep_Legal_Pie_Firma_Nombre,
fila.Rep_Legal_Pie_Firma_Cargo
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Param n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Rep_Legal_Pie_Firma_Nombre,
n.Rep_Legal_Pie_Firma_Cargo
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Param o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Rep_Legal_Pie_Firma_Nombre,
o.Rep_Legal_Pie_Firma_Cargo
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Param o, Pla_Param n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Rep_Legal_Pie_Firma_Nombre,
n.Rep_Legal_Pie_Firma_Cargo,
o.Id,
o.Rep_Legal_Pie_Firma_Nombre,
o.Rep_Legal_Pie_Firma_Cargo,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
}
}
