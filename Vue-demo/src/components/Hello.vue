<template>
  <div id="hello">
    <!-- <h1>{{ msg }}</h1> -->
    <!-- <p v-if="seen">{{ msg }}</p> -->
    <ol>
      <li v-for="todo in todos">
{{todo.text}}
      </li>
    </ol>
  </div>
</template>

<script>
// var app = new Vue({
//   el: '#hello',
//   data: {
//     msg: 'hahahha'
//   }
// })

export default {
  name: 'hello',
  data () {
    return {
      todos: [
        { text: '1111' },
        { text: '2222' },
        { text: '3333' }
      ]
      // seen: true,
      // msg: '小乐子哈哈哈 哈哈 乐子'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
