<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDDashboard.aspx.cs" EnableEventValidation="false" Inherits="CRUDADO.CRUDDashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>        
        /* Styles for disabled text boxes */
        .disabled-input {
            border: 1px solid #ccc;
            padding: 8px;
            font-size: 14px;
            background-color: #f2f2f2; /* Light gray background */
            color: #666; /* Darker gray text */
            cursor: not-allowed; /* Show disabled cursor */
        }
    </style>
    <title>CRUD ADO.Net</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div>
                    <header>
                        <nav class="navbar bg-body-secondary">
                            <div class="container-fluid">
                                <a class="navbar-brand text-warning" href="#">
                                    <img src="../img/L1.png" alt="Logo" width="200" height="50" class="d-inline-block align-text-top" />
                                    CRUD ADO.Net DashBoard
                                </a>                                
                            </div>
                        </nav>
                    </header>
                    <div class="card m-4">
                        <div class="card-body">
                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSID" runat="server" CssClass="form-control disabled-input" ReadOnly="true" placeholder="Enter Students ID"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSFName" runat="server" CssClass="form-control" placeholder="Enter Students First Name"></asp:TextBox>
                                    </div>
                                    <div class="error-message">
                                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtSFName"
                                            ErrorMessage="First name is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexFirstName" runat="server" ControlToValidate="txtSFName"
                                            ErrorMessage="First name should contain only letters."  CssClass="text-danger" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSMName" runat="server" CssClass="form-control" placeholder="Enter Students Middle Name"></asp:TextBox>
                                    </div>
                                    <div class="error-message">
                                        <asp:RequiredFieldValidator ID="rfvMiddleName" runat="server" ControlToValidate="txtSMName"
                                            ErrorMessage="Middle name is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexMName" runat="server" ControlToValidate="txtSMName"
                                            ErrorMessage="Middle name should contain only letters."  CssClass="text-danger" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSLName" runat="server" CssClass="form-control" placeholder="Enter Students Last Name"></asp:TextBox>
                                    </div>
                                    <div class="error-message">
                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtSLName"
                                            ErrorMessage="Last name is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexLastName" runat="server" ControlToValidate="txtSLName"
                                            ErrorMessage="Last name should contain only letters."  CssClass="text-danger" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSAddress" runat="server" CssClass="form-control" placeholder="Enter Students Address" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <div class="error-message">
                                        <asp:RequiredFieldValidator ID="rvfAddress" runat="server" ControlToValidate="txtSAddress"
                                            ErrorMessage="Address is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text text-danger">*</span>
                                        <asp:TextBox ID="txtSPhone" runat="server" CssClass="form-control" placeholder="Enter Students Phone Number" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="error-message">
                                        <asp:RequiredFieldValidator ID="rvfPhone" runat="server" ControlToValidate="txtSPhone"
                                            ErrorMessage="Phone Number is required." Display="Dynamic" CssClass="text-danger" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSPhone"
                                            ErrorMessage="Phone Number should contain only 10 Digits."  CssClass="text-danger" ValidationExpression="^\d{10}$" ValidationGroup="Group1"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row m-5">
                        <div class="col-md-4">
                            <asp:Button ID="btnSelect" runat="server" CssClass="btn btn-primary" Text="Select" OnClick="btnSelect_Click" />
                            <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-secondary" Text="Save" ValidationGroup="Group1" OnClick="btnInsert_Click" />
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-warning" Text="Update" ValidationGroup="Group1" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-dark" Text="Delete" ValidationGroup="Group1" OnClick="btnDelete_Click" />
                        </div>
                    </div>
                    <div class="card m-4">
                        <div class="card-body">
                            <div class="row mt-2">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" AllowPaging="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoPostBack="true"></asp:GridView>
                            </div>
                        </div>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>

</html>
