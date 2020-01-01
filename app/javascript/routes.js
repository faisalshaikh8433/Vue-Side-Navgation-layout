import Dashboard from "./Pages/Dashboard";
import ItemIndex from "./Pages/Items/Index";
import ItemCreate from "./Pages/Items/Create";
import ItemEdit from "./Pages/Items/Edit";

const routes = [
  { path: "/", component: Dashboard },
  { path: "/items", name: "items", component: ItemIndex, props: true },
  { path: "/items/new", component: ItemCreate },
  { path: "/items/edit/:id", component: ItemEdit }
];

export default routes;
