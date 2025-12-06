// src/MapView.jsx
import { useEffect, useState } from "react";
import { MapContainer, TileLayer, Marker, Popup } from "react-leaflet";
import { api } from "./api";


export default function MapView() {
  const [data, setData] = useState(null);

  useEffect(() => {
    api.get("/visits")
      .then((res) => {
        console.log("API Response:", res.data);
        setData(res.data);
      })
      .catch((err) => console.error("API error:", err));
  }, []);

    return (
        <MapContainer
          center={[53.40128, -2.98066]}  // Liverpool
          zoom={13}
          style={{ height: "100vh", width: "100%" }}
        >
          <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
        </MapContainer>
    );

}
