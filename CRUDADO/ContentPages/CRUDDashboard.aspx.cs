using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace CRUDADO
{    
    public partial class CRUDDashboard : System.Web.UI.Page
    {
        private StudentRecords goStudents = new StudentRecords();
        protected void Page_Load(object sender, EventArgs e)
        {                        
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            try
            {                
                DataSet ds = goStudents.GetStudentRecords();

                // Check if DataSet contains any tables
                if (ds != null && ds.Tables.Count > 0)
                {
                    // Assuming your GridView control ID is "GridView1"
                    GridView1.DataSource = ds.Tables[0]; // Bind the first table from DataSet
                    GridView1.DataBind();
                }
                else
                {
                    // No data found, you can display a message or handle it as needed
                    // For example:
                    // lblMessage.Text = "No records found.";
                    // Clear the GridView
                    GridView1.DataSource = null;
                    GridView1.DataBind();

                    // Display a message indicating no records found
                    GridView1.EmptyDataText = "No records found.";
                }
            }
            catch (Exception ex)
            {
                // Handle exception or log error
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        private void Initpage()
        {
            try
            {
                txtSID.Text = goStudents.GetNextStudentId().ToString();
                txtSFName.Text = null;
                txtSMName.Text = null;
                txtSLName.Text = null;
                txtSAddress.Text = null;
                txtSPhone.Text = null;
            }
            catch (Exception ex)
            {
                //throw ex;
                // Display an alert with the exception message using JavaScript
                string errorMessage = $"An error occurred: {ex.Message}";
                string script = $"alert('{errorMessage}');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertScript", script, true);
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                Initpage();
                BindGridView();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }            
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve values from text boxes
                string firstName = txtSFName.Text;
                string middleName = txtSMName.Text;
                string lastName = txtSLName.Text;
                string address = txtSAddress.Text;
                string phone = txtSPhone.Text;
                // Call the AddStudent method to insert a new student record
                bool success = goStudents.AddStudent(Convert.ToInt32(txtSID.Text), firstName, middleName, lastName, address, phone);

                if (success)
                {
                    // Display a success message using JavaScript
                    string script = "alert('Student record added successfully.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessMessage", script, true);

                    // Refresh GridView with updated data
                    BindGridView();
                }
                else
                {
                    // Display an error message if insertion failed
                    string script = "alert('Failed to add student record. Please try again.');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorMessage", script, true);
                }
            }
            catch (Exception ex)
            {
                // Handle exception or log error
                string script = "alert('An error occurred: " + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ExceptionMessage", script, true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}