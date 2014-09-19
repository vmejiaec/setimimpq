// ----------------------------------------------------------------------------
//
// TransactionSupport
//
// Original author: Mike Pagel
//
// After ideas given in
//     http://www.codeproject.com/useritems/typed_dataset_transaction.asp
//     http://entwickler-forum.de/showpost.php?p=2032&postcount=2
//
// ----------------------------------------------------------------------------

using System.Data.SqlClient;
using System.Data;
using System.Reflection;

namespace ADL.BizWiz
{
    /// <summary>
    /// Transaction support for generated table adapters.
    /// </summary>
    /// <remarks>
    /// This class adds transaction support to table adapters. It is used by changing the base
    /// class of a table adapter from Component to this class. The implementation of this class
    /// then accesses the derived table adapter's properties through reflection.
    /// </remarks>
    public abstract class TransactionSupport : System.ComponentModel.Component
    {
        // --------------------------------------------------------------------
        #region Reflective access to table adapter properties
        // --------------------------------------------------------------------
        private SqlConnection Connection
        {
            // Access to propertis as public and non-public as generated table-adapter
            // scope seems to be different for different installations:
            // http://www.codeproject.com/useritems/transactionta.asp?msg=2225021#xx2225021xx
            get
            {
                return (SqlConnection)GetType().GetProperty( "Connection", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance ).GetValue( this, null );
            }
            set
            {
                GetType().GetProperty( "Connection", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance ).SetValue( this, value, null );
            }
        }

        // --------------------------------------------------------------------
        private SqlDataAdapter Adapter
        {
            get
            {
                return (SqlDataAdapter)GetType().GetProperty( "Adapter", BindingFlags.NonPublic | BindingFlags.Instance ).GetValue( this, null );
            }
        }

        // --------------------------------------------------------------------
        private SqlCommand[] CommandCollection
        {
            get
            {
                return (SqlCommand[])GetType().GetProperty( "CommandCollection", BindingFlags.NonPublic | BindingFlags.Instance ).GetValue( this, null );
            }
        }

        #endregion
        // --------------------------------------------------------------------
        #region Properties
        // --------------------------------------------------------------------
        /// <summary>
        /// Transaction of this table adapter.
        /// </summary>
        /// <remarks>
        /// This property is used to share a transaction and its associated connection
        /// across multiple table adapters. The typical pattern is shown in the sample
        /// code below.
        /// </remarks>
        /// <example>
        /// XTableAdapter xta = new XTableAdapter();
        /// YTableAdapter yta = new YTableAdapter();
        /// 
        /// xta.BeginTransation();
        /// yta.Transation = xta.Transaction;
        /// try
        /// {
        ///     // perform xta and yta modifications here.
        ///     xta.CommitTransaction();
        /// }
        /// catch( Exception )
        /// {
        ///     xta.RollbackTransaction();
        /// }
        /// </example>
        public SqlTransaction Transaction
        {
            get
            {
                return transaction;
            }
            set
            {                
                // attach transaction to all commands of this adapter:
                if( CommandCollection != null )
                {
                    foreach( SqlCommand command in CommandCollection )
                    {
                        command.Transaction = value;
                    }
                }
                if( Adapter.InsertCommand != null )
                {
                    Adapter.InsertCommand.Transaction = value;
                }
                if( Adapter.UpdateCommand != null )
                {
                    Adapter.UpdateCommand.Transaction = value;
                }
                if( Adapter.DeleteCommand != null )
                {
                    Adapter.DeleteCommand.Transaction = value;
                }
         
                // also set connection of this adapter accordingly:
                if( value != null )
                {
                    Connection = value.Connection;
                }
                else
                {
                    // only clear connection if it was attached to
                    // transaction before:
                    if( transaction != null ) Connection = null;
                }

                transaction = value;
            }
        }

        #endregion
        // --------------------------------------------------------------------
        #region Operations
        // --------------------------------------------------------------------
        public void BeginTransaction()
        {
            // Open the connection, if needed
            if( Connection.State != ConnectionState.Open )
                Connection.Open();

            // Create the transaction and assign it to the Transaction property
            Transaction = Connection.BeginTransaction();
        }

        // --------------------------------------------------------------------
        public void CommitTransaction()
        {
            // Commit the transaction
            Transaction.Commit();

            // Close the connection
            Connection.Close();
        }

        // --------------------------------------------------------------------
        public void RollbackTransaction()
        {
            // Rollback the transaction
            Transaction.Rollback();

            // Close the connection
            Connection.Close();
        }

        #endregion
        // --------------------------------------------------------------------
        #region Fields
        // --------------------------------------------------------------------
        /// <summary>
        /// Fields supporting properties.
        /// </summary>
        private SqlTransaction transaction;

        #endregion
        // --------------------------------------------------------------------

    }
}