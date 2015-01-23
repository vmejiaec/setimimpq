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
    public class DO_Pla_PersonalDatos
    {
	// adapter
    public Pla_PersonalDatosTableAdapter Adapter = new Pla_PersonalDatosTableAdapter();
	//Select
	public List<Pla_PersonalDatos> Get(Scope s)
    {
        List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_PersonalDatos(
				fila.Id,
fila.Per_Personal_Id,
fila.Pie_Firma_Nombre,
fila.Pie_Firma_Cargo,
fila.Email_Inst,
fila.Pie_Firma_Iniciales,
fila.Per_Personal_Nombre,
fila.Per_Personal_NumeroDoc
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_PersonalDatos n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Per_Personal_Id,
n.Pie_Firma_Nombre,
n.Pie_Firma_Cargo,
n.Email_Inst,
n.Pie_Firma_Iniciales
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_PersonalDatos o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Per_Personal_Id,
o.Pie_Firma_Nombre,
o.Pie_Firma_Cargo,
o.Email_Inst,
o.Pie_Firma_Iniciales
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_PersonalDatos o, Pla_PersonalDatos n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Per_Personal_Id,
n.Pie_Firma_Nombre,
n.Pie_Firma_Cargo,
n.Email_Inst,
n.Pie_Firma_Iniciales,
o.Id,
o.Per_Personal_Id,
o.Pie_Firma_Nombre,
o.Pie_Firma_Cargo,
o.Email_Inst,
o.Pie_Firma_Iniciales,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_PersonalDatos> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_PersonalDatos(
				fila.Id,
fila.Per_Personal_Id,
fila.Pie_Firma_Nombre,
fila.Pie_Firma_Cargo,
fila.Email_Inst,
fila.Pie_Firma_Iniciales,
fila.Per_Personal_Nombre,
fila.Per_Personal_NumeroDoc
				));
			}
			return lista;
		}
		// GetByLikePer_Personal_Nombre
		public List<Pla_PersonalDatos> GetByLikePer_Personal_Nombre (Scope s , string p_Per_Personal_Nombre)
		{
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>();
			var tabla = Adapter.GetByLikePer_Personal_Nombre( p_Per_Personal_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_PersonalDatos(
				fila.Id,
fila.Per_Personal_Id,
fila.Pie_Firma_Nombre,
fila.Pie_Firma_Cargo,
fila.Email_Inst,
fila.Pie_Firma_Iniciales,
fila.Per_Personal_Nombre,
fila.Per_Personal_NumeroDoc
				));
			}
			return lista;
		}
		// GetByPer_Personal_Id
		public List<Pla_PersonalDatos> GetByPer_Personal_Id (Scope s , string p_Per_Personal_Id)
		{
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>();
			var tabla = Adapter.GetByPer_Personal_Id( p_Per_Personal_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_PersonalDatos(
				fila.Id,
fila.Per_Personal_Id,
fila.Pie_Firma_Nombre,
fila.Pie_Firma_Cargo,
fila.Email_Inst,
fila.Pie_Firma_Iniciales,
fila.Per_Personal_Nombre,
fila.Per_Personal_NumeroDoc
				));
			}
			return lista;
		}
	}
}
