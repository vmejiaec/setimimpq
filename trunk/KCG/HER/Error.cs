using System;
using System.Web.Services.Protocols;
using System.Xml;

namespace HER
{
    public enum CausaError
    {
        ClaveNoValida,
        ClaveForaneaNoValida,
        NoDefinida
    }

    public class Error
    {
        public static void EmitirExcepcion(string mensaje, string caso)
        {
            Exception eCaso = new System.Exception(caso);
            Exception otroEX = new System.Exception(mensaje, eCaso);
            throw otroEX;
        }


        public static XmlNode ConstruirDetalleExcepcion(string codigoError, string codigoMensaje)
        {
            return ConstruirDetalleExcepcion(codigoError, codigoMensaje, "", CausaError.NoDefinida);
        }

        public static XmlNode ConstruirDetalleExcepcion(string codigoError, string codigoMensaje, string campoErrado, CausaError causaError)
        {
            XmlDocument doc = new XmlDocument();
            XmlNode node = doc.CreateNode(XmlNodeType.Element,
                                          SoapException.DetailElementName.Name,
                                          SoapException.DetailElementName.Namespace);

            // Agregar detalles de excepcion
            XmlNode detalleError = doc.CreateNode(XmlNodeType.Element, "DetalleError", "http://koala.org/");
            XmlAttribute attr = doc.CreateAttribute("CodigoError");
            attr.Value = codigoError;
            detalleError.Attributes.Append(attr);

            XmlElement elementMensajePantalla = doc.CreateElement("CodigoMensaje", "http://koala.org/");
            elementMensajePantalla.InnerText = codigoMensaje;
            detalleError.AppendChild(elementMensajePantalla);

            XmlElement elementCampoErrado = doc.CreateElement("CampoErrado", "http://koala.org/");
            elementCampoErrado.InnerText = campoErrado;
            detalleError.AppendChild(elementCampoErrado);

            XmlElement elementCausaError = doc.CreateElement("CausaError", "http://koala.org/");
            elementCausaError.InnerText = causaError.ToString();
            detalleError.AppendChild(elementCausaError);

            // Agregar 
            node.AppendChild(detalleError);

            return node;
        }

        public static string ObtenerNombreCampo (string mensajeError)
        {
            return mensajeError.Split('\'')[1].Substring(3);
        }

        public static SoapException ConstruirExcepcion(Exception e, string uriAbsoluta)
        {
            SoapException soapException;
            string mensajeInterno = "";
            if (e.InnerException != null) mensajeInterno = e.InnerException.Message;
            soapException = new SoapException(
                "Fallo: " + e.Message,
                SoapException.ClientFaultCode,
                uriAbsoluta,
                ConstruirDetalleExcepcion(e.Message, mensajeInterno));
            return soapException;
        }
    }
}