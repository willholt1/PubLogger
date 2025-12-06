// src/MapView.jsx
import { useEffect, useState } from "react";
import { MapContainer, TileLayer, Marker, Popup } from "react-leaflet";
import L from "leaflet";
import { api } from "./api";

// Fix Vite/Leaflet icon paths
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

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

  if (!data) return <div>Loading...</div>;

  return (
    <pre style={{ whiteSpace: "pre-wrap", padding: "20px" }}>
      {JSON.stringify(data, null, 2)}
    </pre>
  );
    

}
