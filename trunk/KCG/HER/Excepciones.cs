using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Xml.Schema;

namespace HER
{
    public class Excepciones
    {
        public class UpdateCeroRegistros : ApplicationException
        {
            public UpdateCeroRegistros(SerializationInfo info, StreamingContext context) : base(info, context)
            {
            }

            public UpdateCeroRegistros(string message, Exception innerException) : base(message, innerException)
            {
            }

            public UpdateCeroRegistros(string message) : base(message)
            {
            }

            public UpdateCeroRegistros()
            {
            }
        }

        public class DeleteCeroRegistros : ApplicationException
        {
            public DeleteCeroRegistros(SerializationInfo info, StreamingContext context) : base(info, context)
            {
            }

            public DeleteCeroRegistros(string message, Exception innerException) : base(message, innerException)
            {
            }

            public DeleteCeroRegistros(string message) : base(message)
            {
            }

            public DeleteCeroRegistros()
            {
            }
        }
    }
}