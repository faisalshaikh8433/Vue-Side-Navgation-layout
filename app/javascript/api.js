import axios from "axios";

let csrfToken = document
  .querySelector('meta[name="csrf-token"]')
  .getAttribute("content");

const api = axios.create({
  headers: {
    Accept: "application/json",
    "X-CSRF-TOKEN": csrfToken
  }
});
export default api;
