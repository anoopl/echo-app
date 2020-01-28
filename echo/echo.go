package main

import (
	"log"
	"net/http"
)

//Echo back the requets
func echoHandler(writer http.ResponseWriter, request *http.Request) {
	log.Println("Echo the request back")
	request.Write(writer)

}

//Start the http server on port 8080
func main() {
	log.Println("Starting Echo Server")
	http.HandleFunc("/", echoHandler)
	http.ListenAndServe(":8080", nil)
}
