<template>
  <v-container class="fluid grid-list-xl" fluid>
    <div class="align-center">
      <v-icon icon="mdi-list-box-outline"></v-icon> &nbsp;
      <span style="font-size: large; align-items: center; font-weight: bold"
        >상품관리</span
      >
    </div>
    <div>
      <div class="float-left"></div>
      <div class="float-right">
        <v-btn><v-icon icon="mdi-reload"></v-icon></v-btn>
        <v-btn><v-icon icon="mdi-magnify"></v-icon></v-btn>
      </div>
    </div>
    <br />
    <br />
    <v-row style="height: 70px">
      <v-col class="d-flex align-center" cols="12" sm="6">
        <v-select
          label="업체"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>

      <v-col class="d-flex" cols="12" sm="6">
        <v-select
          label="상품구분"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>
    </v-row>
    <v-row>
      <v-col class="d-flex align-center" cols="12" sm="6">
        <v-select
          label="상품상태"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>

      <v-col class="d-flex" cols="12" sm="6">
        <v-select
          label="주문갯수"
          density="compact"
          :items="[
            'California',
            'Colorado',
            'Florida',
            'Georgia',
            'Texas',
            'Wyoming',
          ]"
          variant="outlined"
          color="green-accent-1"
        >
        </v-select>
      </v-col>
    </v-row>
    <v-row>
      <v-spacer></v-spacer>
      <v-spacer></v-spacer>
      <v-divider></v-divider>
    </v-row>
    <v-row>
      <div ref="table"></div>
    </v-row>
  </v-container>
</template>
<script>
import { TabulatorFull as Tabulator } from "tabulator-tables"; //import Tabulator library
import "tabulator-tables/dist/css/tabulator_semanticui.css";
export default {
  data() {
    return {
      tabulator: null, //variable to hold your table
      tableData: [
        { id: 1, name: "Oli Bob", age: "12", col: "red", dob: "" },
        { id: 2, name: "Mary May", age: "1", col: "blue", dob: "14/05/1982" },
        {
          id: 3,
          name: "Christine Lobowski",
          age: "42",
          col: "green",
          dob: "22/05/1982",
        },
        {
          id: 4,
          name: "Brendon Philips",
          age: "125",
          col: "orange",
          dob: "01/08/1980",
        },
        {
          id: 5,
          name: "Margret Marmajuke",
          age: "16",
          col: "yellow",
          dob: "31/01/1999",
        },
      ], //data for table to display
    };
  },
  mounted() {
    //instantiate Tabulator when element is mounted
    this.tabulator = new Tabulator(this.$refs.table, {
      height: 500, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
      data: this.tableData, //assign data to table
      layout: "fitColumns", //fit columns to width of table (optional)
      columns: [
        //Define Table Columns
        { title: "Name", field: "name", width: 150 },
        { title: "Age", field: "age", hozAlign: "left", formatter: "progress" },
        { title: "Favourite Color", field: "col" },
        {
          title: "Date Of Birth",
          field: "dob",
          sorter: "date",
          hozAlign: "center",
        },
      ],
    });
  },
};
</script>

<style lang="scss">
.select-box {
  height: 20px;
  width: 120px;
}
</style>
