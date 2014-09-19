/*
KOALA SOLUTION 
 
MetodosGet     - Enumerado de tipos de métodos
ParametrosGet  - Diccionario de parametros
Filtrado       - Analiza expresiones de filtrado para obtener
                 el método CEL a ser llamado y su filtro.
ver 1.0

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: KoalaFramework Asp.Net              
							
NOTAS DE DISEÑO

 * Version 1.0
   - Los métodos LikeCodigo prevalecen sobre LikeNombre.
  
HISTORIA     					 

 * Version 1.0
   - 

TRABAJO FUTURO
   - 

ÚLTIMA FECHA DE MODIFICACIÓN
03-07-2008 12H39

*/


using System;
using System.Collections.Generic;
using System.Text;

namespace HER
{
    public enum MetodosGet
    {
        GetByLikeNombre,
        GetByLikeCodigoHasta,
        GetByLikeCodigoDesde,
        GetByLikeCodigoDesdeHasta,
        GetByEstado,
        NoDefinido
    };

    public class ParametrosGet : Dictionary<string, string> { };

    public class FiltroDiccionario : Dictionary<string, string>
    {
        public FiltroDiccionario() : base(StringComparer.OrdinalIgnoreCase) { }
    }

    public class Filtrado
    {
        private static readonly string[] _separacion = { " AND " };

        static public int AnalizarExpresionDeFiltrado(string expresionFiltrado,
            string[] campos, out FiltroDiccionario filtroCampos,
            out string filtroParaCEL)
        {
            filtroParaCEL = null;
            filtroCampos = null;
            if (string.IsNullOrEmpty(expresionFiltrado))
                return 0;

            string[] filtros = expresionFiltrado.Split(_separacion, StringSplitOptions.RemoveEmptyEntries);
            StringBuilder stbFiltroParaCEL = new StringBuilder();
            filtroCampos = new FiltroDiccionario();
            int encontrados = 0;
            for (int i = 0; i < filtros.Length; i++)
            {
                for (int j = 0; j < campos.Length; j++)
                {
                    if (filtros[i].StartsWith(campos[j], StringComparison.OrdinalIgnoreCase))
                    {
                        string filtro = filtros[i];
                        //int indiceUltimoEspacioBlanco = filtro.LastIndexOf(" ");
                        string valor = filtro.Substring(campos[j].Length).Trim();
                        filtroCampos[campos[j]] = valor;
                        encontrados++;
                    }
                    else
                    {
                        if (i == 0)
                        {
                            if (!filtroCampos.ContainsKey(campos[j]))
                                filtroCampos[campos[j]] = "";
                        }
                        stbFiltroParaCEL.Append(filtros[i]);
                        stbFiltroParaCEL.Append(_separacion[0]);
                    }
                }
            }

            if (stbFiltroParaCEL.Length >= _separacion[0].Length)
            {
                stbFiltroParaCEL.Replace(_separacion[0],
                                         "",
                                         stbFiltroParaCEL.Length - _separacion[0].Length,
                                         _separacion[0].Length);
            }

            return encontrados;
        }

        public static void AnalizarExpresionDeFiltrado(string expresionFiltrado,
            out ParametrosGet parametros,
            out MetodosGet metodoGet,
            out string filtroParaCEL)
        {
            filtroParaCEL = string.Empty;
            metodoGet = MetodosGet.NoDefinido;
            parametros = new ParametrosGet();

            if (string.IsNullOrEmpty(expresionFiltrado))
                return;
            
            string[] filtros = expresionFiltrado.Split(_separacion, StringSplitOptions.RemoveEmptyEntries);

            StringBuilder stbFiltroParaCEL = new StringBuilder();

            for (int i = 0; i < filtros.Length; i++)
            {
                string filtro = filtros[i];
                if (filtro.StartsWith("Codigo_int <="))
                {
                    if (metodoGet == MetodosGet.GetByLikeCodigoDesde)
                        metodoGet = MetodosGet.GetByLikeCodigoDesdeHasta;
                    else
                        metodoGet = MetodosGet.GetByLikeCodigoHasta;
                    parametros["hasta_Codigo"] = ObtenerValorFiltro(filtro);
                    continue;

                }
                else if (filtro.StartsWith("Codigo_int >="))
                {
                    if (metodoGet == MetodosGet.GetByLikeCodigoHasta)
                        metodoGet = MetodosGet.GetByLikeCodigoDesdeHasta;
                    else
                        metodoGet = MetodosGet.GetByLikeCodigoDesde;
                    parametros["desde_Codigo"] = ObtenerValorFiltro(filtro);
                    continue;
                }
                else if (filtro.StartsWith("Nombre "))
                {
                    if (metodoGet == MetodosGet.NoDefinido)
                    {
                        metodoGet = MetodosGet.GetByLikeNombre;
                        parametros["nombre"] = ObtenerValorFiltro(filtro);
                    }
                    continue;
                }
                stbFiltroParaCEL.Append(filtro);
                stbFiltroParaCEL.Append(_separacion[0]);
            }

            if (metodoGet != MetodosGet.GetByLikeNombre && parametros.ContainsKey("nombre"))
            {
                stbFiltroParaCEL.Append("Nombre LIKE '");
                stbFiltroParaCEL.Append(parametros["nombre"]);
                stbFiltroParaCEL.Append("' ");
                parametros.Remove("nombre");
            }

            if (stbFiltroParaCEL.Length >= _separacion[0].Length)
            {
                stbFiltroParaCEL.Replace(_separacion[0],
                                         "",
                                         stbFiltroParaCEL.Length - _separacion[0].Length,
                                         _separacion[0].Length);
            }

            filtroParaCEL = stbFiltroParaCEL.ToString();
        }

        static public string ObtenerValorFiltro(string filtro)
        {
            int primerIndice = filtro.IndexOf("'");
            int ultimoIndice = filtro.LastIndexOf("'");
            return filtro.Substring(primerIndice + 1, ultimoIndice - primerIndice - 1);
        }

        static public string NormalizarFiltrado(string filtro, string simbolo, string simboloReemplazar)
        {
            if (string.IsNullOrEmpty(filtro))
                return simboloReemplazar;
            return filtro.Trim().Replace(simbolo, simboloReemplazar);
        }

        /************************************************************************/
        static public decimal NormalizarFiltradoDecimal(string filtro, string simbolo)
        {
            string filtroValor = null;
            if (string.IsNullOrEmpty(filtro))
            {
                if (simbolo == "Desde")
                    filtroValor = "0";
                else if (simbolo == "Hasta")
                    filtroValor = "99999999,9999";
                return Convert.ToDecimal(filtroValor);
            }
            else
                return Convert.ToDecimal(filtro);
        }

        static public string NormalizarFiltradoCodigo(string filtro, string simbolo)
        {
            string filtroValor = null;
            if (string.IsNullOrEmpty(filtro))
            {
                if (simbolo == "Desde")
                    filtroValor = "0";
                else if (simbolo == "Hasta")
                    filtroValor = "9999999999";
                return filtroValor;
            }
            else
                return filtro;
        }

        static public DateTime NormalizarFiltradoFechas(string filtro, string simbolo)
        {
            string filtroValor = null;
            if (string.IsNullOrEmpty(filtro))
            {
                if (simbolo == "Desde")
                    filtroValor = "01/01/1900";
                else if (simbolo == "Hasta")
                    filtroValor = "01/06/2078";
                return Convert.ToDateTime(filtroValor);
            }
            else
                return Convert.ToDateTime(filtro);
        }

        static public Int32 NormalizarFiltradoEnteros(string filtro, string simbolo)
        {
            string filtroValor = null;
            if (string.IsNullOrEmpty(filtro))
            {
                if (simbolo == "Desde")
                    filtroValor = "0";
                else if (simbolo == "Hasta")
                    filtroValor = "99999999";
                return Convert.ToInt32(filtroValor);
            }
            else
                return Convert.ToInt32(filtro);
        }
    }
}
