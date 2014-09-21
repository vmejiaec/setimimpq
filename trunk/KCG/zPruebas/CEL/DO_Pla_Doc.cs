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
    public class DO_Pla_Doc
    {
	// adapter
    public Pla_DocTableAdapter Adapter = new Pla_DocTableAdapter();
	//Select
	public List<Pla_Doc> Get(Scope s)
    {
        List<Pla_Doc> lista = new List<Pla_Doc>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Doc(
				fila.Id,
fila.Codigo,
fila.Tipo,
fila.Fecha,
fila.Per_Personal_Id_Solicita,
fila.Area_Solicita,
fila.Descripcion,
fila.Estado,
fila.Per_Personal_Id_Crea,
fila.Per_Personal_Id_Modifica
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Doc n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Tipo,
n.Fecha,
n.Per_Personal_Id_Solicita,
n.Area_Solicita,
n.Descripcion,
n.Estado,
n.Per_Personal_Id_Crea,
n.Per_Personal_Id_Modifica
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Doc o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Tipo,
o.Fecha,
o.Per_Personal_Id_Solicita,
o.Area_Solicita,
o.Descripcion,
o.Estado,
o.Per_Personal_Id_Crea,
o.Per_Personal_Id_Modifica
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Doc o, Pla_Doc n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Tipo,
n.Fecha,
n.Per_Personal_Id_Solicita,
n.Area_Solicita,
n.Descripcion,
n.Estado,
n.Per_Personal_Id_Crea,
n.Per_Personal_Id_Modifica,
o.Id,
o.Codigo,
o.Tipo,
o.Fecha,
o.Per_Personal_Id_Solicita,
o.Area_Solicita,
o.Descripcion,
o.Estado,
o.Per_Personal_Id_Crea,
o.Per_Personal_Id_Modifica,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
}
}
