import Axios from "axios";
import React, { useCallback, useContext } from "react";
import { useDropzone } from "react-dropzone";
import { AuthContext } from "../providers/AuthProvider";

export default function DropZoneDemo() {
  const { setUser } = useContext(AuthContext);
  const onDrop = useCallback((acceptedFiles) => {
    // Do something with the files
    console.log(("acceptedFiles", acceptedFiles));
    let data = new FormData();
    data.append("file", acceptedFiles[0]);
    // Axios.put("/api/basic_upload", data)
    Axios.put("/api/update_user_imagine", data)
      .then((res) => {
        setUser(res.data.user);
        debugger;
      })
      .catch((err) => {
        debugger;
      });
  }, []);
  const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop });

  return (
    <div {...getRootProps()}>
      <input {...getInputProps()} />
      {isDragActive ? (
        <p>Drop the files here ...</p>
      ) : (
        <p>Drag 'n' drop some files here, or click to select files</p>
      )}
    </div>
  );
}
