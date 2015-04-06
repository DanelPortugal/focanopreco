<?php // You need to add server side validation and better error handling here

$data = array();

if(isset($_GET['files']))
{  
	$error = false;
	$files = array();

	$uploaddir = '../../image_repository/thumb/';
	foreach($_FILES as $file)
	{
		if(move_uploaded_file($file['tmp_name'], $uploaddir .basename($file['name'])))
		{
		    $path = $file['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
			//rename($uploaddir.$file['name'],$uploaddir.$_COOKIE['sauto3CoUsuario'].".jpg");
            $files[] = $uploaddir.$file['name'];
            
            //setcookie("sauto3ImUsuario", $uploaddir.$_COOKIE['sauto3CoUsuario'].".jpg", 0, '/');
		}
		else
		{
		    $error = true;
		}
	}
	$data = ($error) ? array('error' => 'There was an error uploading your files') : array('files' => $files);
}
else
{
	$data = array('success' => 'Form was submitted', 'formData' => $_POST);
}

echo json_encode($data);

?>