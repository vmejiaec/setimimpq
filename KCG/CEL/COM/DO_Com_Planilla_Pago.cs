using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.ComprasTableAdapters;
using AEL.COM;
using BEL;
using System.Data.SqlClient;

namespace CEL.COM
{
    public class DO_Com_Planilla_Pago
    {
	// adapter
    public Com_Planilla_PagoTableAdapter Adapter = new Com_Planilla_PagoTableAdapter();
	//Select
	public List<Com_Planilla_Pago> Get(Scope s)
    {
        List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Planilla_Pago(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Fecha_Pago,
fila.Comprobante_Pago,
fila.Factura_Memo_Pago,
fila.Valor_Cta_X_Cobrar,
fila.Fecha_Pago_Confirmada
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Planilla_Pago n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Fis_Planilla_Id,
n.Fecha_Pago,
n.Comprobante_Pago,
n.Factura_Memo_Pago,
n.Valor_Cta_X_Cobrar,
n.Fecha_Pago_Confirmada
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Planilla_Pago o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Fis_Planilla_Id,
o.Fecha_Pago,
o.Comprobante_Pago,
o.Factura_Memo_Pago,
o.Valor_Cta_X_Cobrar,
o.Fecha_Pago_Confirmada
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Planilla_Pago o, Com_Planilla_Pago n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Fis_Planilla_Id,
n.Fecha_Pago,
n.Comprobante_Pago,
n.Factura_Memo_Pago,
n.Valor_Cta_X_Cobrar,
n.Fecha_Pago_Confirmada,
o.Id,
o.Fis_Planilla_Id,
o.Fecha_Pago,
o.Comprobante_Pago,
o.Factura_Memo_Pago,
o.Valor_Cta_X_Cobrar,
o.Fecha_Pago_Confirmada,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByFis_Planilla_Id
		public List<Com_Planilla_Pago> GetByFis_Planilla_Id (Scope s , string p_Fis_Planilla_Id)
		{
			List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>();
			var tabla = Adapter.GetByFis_Planilla_Id( p_Fis_Planilla_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Planilla_Pago(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Fecha_Pago,
fila.Comprobante_Pago,
fila.Factura_Memo_Pago,
fila.Valor_Cta_X_Cobrar,
fila.Fecha_Pago_Confirmada
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Planilla_Pago> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Planilla_Pago(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Fecha_Pago,
fila.Comprobante_Pago,
fila.Factura_Memo_Pago,
fila.Valor_Cta_X_Cobrar,
fila.Fecha_Pago_Confirmada
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Planilla_Pago n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Fis_Planilla_Id,
n.Fecha_Pago,
n.Comprobante_Pago,
n.Factura_Memo_Pago,
n.Valor_Cta_X_Cobrar,
n.Fecha_Pago_Confirmada
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
