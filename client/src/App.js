import { useState, useEffect } from "react";
import axios from 'axios';
function App() {
  const [ setNotes] =useState([])
        useEffect(() =>{
            axios
            .get("http://localhost:3000/notes")
            .then(res =>{
                setNotes(res.notes)

            })
            .catch(err =>{
                console.log(err)
            })

    }
        
    )
  }
export default App;