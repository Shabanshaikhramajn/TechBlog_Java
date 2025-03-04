<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.User"%>

<%@page errorPage="error_page.jsp" %>
<%  

User user = (User)session.getAttribute("currentUser");

if(user ==null){

    response.sendRedirect("login_page.jsp");

    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            
            .banner-background{
                
              clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 81%, 63% 95%, 31% 83%, 0 93%, 0 0);
            }
            
            
        </style>
        
        
        
        
        
    </head>
    <body>
      
        <!--navbar-->
        
        <nav class="navbar navbar-expand-lg navbar-dark  primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-book"></span>Learn code with shaban <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square"></span>   Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Lang</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      
      <li class="nav-item">
          <a class="nav-link" href="#"> <span class="	fa fa-comments"></span>Contact</a>
      </li>
      
     
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="	fa fa-asterick"></span>DoPost</a>
      </li>
      
    
      
      
      
      
    </ul>
      <ul class="navbar-nav mr-right">
          
           <li class="nav-item">
          <a class="nav-link" href="#!"  data-toggle="modal" data-target="#profile-modal" > <span class="fa fa-user-circle "> <%= user.getName()%></a>
      </li>
          
          
           <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus ">Log Out</a>
      </li>
          
          
      </ul>
  </div>
</nav>
        <!--end of navbar-->
    
        
        
        
        <!--start of modal-->
        
        
        
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
             
               <img src="pics/<%= user.getProfile()%>"  class="img-fluid" style="border-radius:50%; max-width:150px " >
               <br>
              
                <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%> </h5>
                
                <!--details-->
                <div id="profile-details">
                <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">Id</th>
      <td><%=  user.getId()%></td>
      
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%=  user.getEmail()%></td>
     
    </tr>
    <tr>
      <th scope="row">gender :</th>
      <td><%= user.getGender()%></td>
     
    </tr>
    
    <tr>
      <th scope="row">Status :</th>
      <td><%= user.getAbout()%></td>
     
    </tr>
  </tbody>
</table>
      
          </div>
      
      
           <!--table end-->     
                
           <!--profile edit-->
           
           
           <div id="profile-edit" style="display:none;">
               
               <h3 class="mt-2">
                   please Edit Carefully
               </h3>
               <form action="EditServlet" method="post" enctype="multipart/form-data">
                   <table class="table">
                       
                       <tr>
                             <td>Id:</td>
                           <td><%=user.getId()%></td>
                         
                       </tr>
                       <tr>
                             <td>Email:</td>
                             <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                         
                       </tr>
                       
                        <tr>
                             <td>Name:</td>
                             <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                         
                       </tr>
                       <tr>
                             <td>Password</td>
                             <td><input type="password" class="form-control" name="user_passsword" value="<%=user.getPassword()%>"></td>
                         
                       </tr>
                       
                        <tr>
                             <td>Gender:</td>
                             <td><%=user.getGender().toUpperCase()%></td>
                         
                       </tr>
                       
                        <tr>
                             <td>About</td>
                             <td><textarea  rows="4" class="form-control" name="user_about" > <%= user.getAbout()%>
                                 
                                 </textarea></td>
                         
                       </tr>
                       
                       
                       <tr>
                             <td>New Profile:</td>
                             <td><input type="file" name="image"  class="form-control">
                             </td>
                         
                       </tr>
                       
                       
                   </table>
                             <div class="container">
                                 
                                 <button type="submit" class="btn btn-outline-primary">Save</button>
                                 
                                 
                             </div>
                   
                   
                   
                   
               </form>
               
               
               
               
               
           </div>
           
           
                
                
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
        
        <!--end of modal-->
        
        <!--add post modal-->
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  
                  <input type="text" name="pTitle" placeholder="Enter post title" class="form-control"/>
                  
              </div>
              <div class="form-group">
                  <select class="form-control" name="cid" >
                  <option selected disabled>--- select category---</option>
                
                  
                  <% 
                  
                  PostDao postd = new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> list = postd.getAllCategories();
                  for(Category c:list){
                  %>
                  
                  <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                 
                  
                  <%
                      
                      }%>
                  
              </select>
              
              </div>
              <div class="form-group" >
                  <textarea  name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content" ></textarea>
                  
                  
              </div>
              
              <div class="form-group" >
                  <textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your program(if any)" ></textarea>
                  
             </div>
              
              <div class="form-group" >
                  <label>select your pic</label>
                  <br>
                  <input type="file" name="pic" />
                  
                  
                  
              </div>
                      
                      <div class="container text-center">
                          
                          <button type="submit" class="btn btn-outline-primary">Post</button>
                          
                          
                      </div>
              
          </form>
          
          
          
          
      </div>
      
    </div>
  </div>
</div>
        
        <!--end post modal-->
        
        
        <!--javascript start-->
        
         <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
            $(document).ready(function(){
                
                let editStatus = false;
                
                
                
               $('#edit-profile-button').click(function(){
                   
                   if(editStatus == false){
                      
            $("#profile-details").hide()
                   
                   $("#profile-edit").show();
                   
                   editStatus = true;
                   
                   $(this).text("Back")
                   
                   
                   
                   }else{
                        $("#profile-details").show()
                       
                        $("#profile-edit").hide();
                   
                   editStatus = false;
                       
                        $(this).text("Edit")
                       
                       
                   }
                   
                   
                   
                   
               })
                
            });

        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function(e){
                
            $("#add-post-form").on("submit", function(event){
                
                //this code gets called when form is submitted
                event.preventDefault();
                console.log("you have clicked on submit")
                let form = new FormDate(this);
                
               //now requestion to server
               $.ajax({
                   url:"AddPostServlet",
                   type:'POST',
                   data: form,
                   success: function(data,textStatus, jqXHR){
                       
                       console.log(data);
                   },
                   error: function(jqXHR, textStatus, errorThrown){
                       
                       
                   },
                   processData: false;
                   contentType: false;
                   
                   
                   
               });
               
                
                
            });
                
            });
            
            
            
            
            
            
            
            
            
            
        </script>
        
        
        
        
    </body>
</html>
