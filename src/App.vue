<template>
  <div id="app">
    <div class="banner">
      <h1>Gestión de calidad de sistemas</h1>
      <div class="button-row">
        <router-link class="button" to="/pagina1">Commits</router-link>
      </div>
    </div>
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>
/* Estilos para el banner o navbar */

#app{
  background-color: #f5e5dc;
  margin: -3px;
  padding:10px;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.banner {
  background-color: #007bff;
  color: white;
  margin: -20px;
  padding: 5px;
  text-align: center;
}

.banner h1 {
  margin: 0;
  font-size: 2em;
}
.banner h3 {
  margin: 0;
  justify-content: left;
  font-size: 1em;
}

/* Estilos para la fila de botones */
.button-row {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.button {
  text-decoration: none;
  color: white;
  background-color: #28a745;
  padding: 15px 30px;
  margin: 10px;
  border-radius: 5px;
  font-size: 1.2em;
}

.button:hover {
  background-color: #218838;
}
</style>
