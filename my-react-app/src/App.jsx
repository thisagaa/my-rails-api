import { useEffect, useState } from "react";
import axios from "axios";

function App() {
  const [orders, setOrders] = useState([]);

  useEffect(()=> {
    axios.get("http://localhost:3000/orders")
      .then((response) => {
        console.log("API Response:", response.data);
        setOrders(response.data);
    })
    .catch(error => {
      console.error("Error fetching orders:", error);
    });
  }, []);

  return (
    <div>
      <h1>Orders</h1>
      <ul>
        {orders.map(order => (
          <li key={order.id}>
            <strong>{order.name}</strong> - {order.status} -${order.total_price} (Created : {new Date(order.created_at).toLocaleString()})
          </li>
        ))}
      </ul>
    </div>
  )
}

export default App;