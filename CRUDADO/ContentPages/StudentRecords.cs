using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CRUDADO
{
    public class StudentRecords
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
        public int GetNextStudentId()
        {
            int nextID = 0;

            try
            {
                // Get the connection 
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetNextStudentId", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        //Execute Scalar because suitable for single value returns with compatible casting type without datareaders.
                        nextID = (int)command.ExecuteScalar();

                    }
                }

            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Console.WriteLine("Error: " + ex.Message);
            }

            return nextID;
        }

        public DataSet GetStudentRecords() 
        {
            DataSet lds = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString)) 
                {
                    using (SqlCommand command = new SqlCommand("GetStudentRecords",connection)) 
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command)) 
                        {
                            adapter.Fill(lds);
                        }
                            
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("Error: " + ex.Message);
            }

            return lds;
        }

        public bool AddStudent(int ID,string firstName, string middleName, string lastName, string address, string phone)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("AddStudent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        command.Parameters.AddWithValue("@ID", ID);
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@MiddleName", middleName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@Phone", phone);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the insertion was successful
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception or log error
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }

        public bool UpdateStudent(int ID, string firstName, string middleName, string lastName, string address, string phone)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("UpdateStudent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        command.Parameters.AddWithValue("@ID", ID);
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@MiddleName", middleName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@Phone", phone);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the insertion was successful
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception or log error
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }

        public bool DeleteStudent(int ID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand("DeleteStudent", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        command.Parameters.AddWithValue("@ID", ID);
                        
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the insertion was successful
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception or log error
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }
    }
}