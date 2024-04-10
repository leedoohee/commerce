<template>
    <v-container
        class="fluid grid-list-xl"
        fluid
    >
        <div class="align-center">
            <span><v-icon icon="mdi-list-box-outline"></v-icon></span> &nbsp; 
            <span style="font-size: large; align-items: center; font-weight: bold;">상품관리</span>
        </div>
        <div>
            <div class="float-left">
            </div>
            <div class="float-right">
                <v-btn><v-icon icon="mdi-reload"></v-icon></v-btn>
                <v-btn><v-icon icon="mdi-magnify"></v-icon></v-btn>
            </div>
        </div>
        <br>
        <br>
        <v-row style="height: 70px;">
            <v-col
                class="d-flex align-center"
                cols="12"
                sm="6"
            >
                <v-select
                    label="업체"
                    density="compact"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="outlined"
                    color="green-accent-1"
                >
                </v-select>
            </v-col>

            <v-col
                class="d-flex"
                cols="12"
                sm="6"
            >
                <v-select
                    label="상품구분"
                    density="compact"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="outlined"
                    color="green-accent-1"
                >
                </v-select>
            </v-col>
        </v-row>
        <v-row>
            <v-col
                class="d-flex align-center"
                cols="12"
                sm="6"
            >
                <v-select
                    label="상품상태"
                    density="compact"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
                    variant="outlined"
                    color="green-accent-1"
                >
                </v-select>
            </v-col>

            <v-col
                class="d-flex"
                cols="12"
                sm="6"
            >
                <v-select
                    label="주문갯수"
                    density="compact"
                    :items="['California', 'Colorado', 'Florida', 'Georgia', 'Texas', 'Wyoming']"
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
        <ag-grid-vue
            :rowData="items"
            :columnDefs="colDefs"
            style="height: 500px"
            class="ag-theme-quartz"
        ></ag-grid-vue>
    </v-container>
</template>

<script>
    import { ref, defineProps, reactive } from 'vue'
    import "ag-grid-community/styles/ag-grid.css";
    import "ag-grid-community/styles/ag-theme-quartz.css";
    import { AgGridVue } from "ag-grid-vue3";

    export default {
        name: "Categories",
        components: {
            AgGridVue
        },
        setup() {
            defineProps('categories');

            const search = ref('')
            const items = reactive([
                {
                    name: 'Nebula GTX 3080',
                    image: '1.png',
                    price: 699.99,
                    rating: 5,
                    stock: true,
                },
                {
                    name: 'Galaxy RTX 3080',
                    image: '2.png',
                    price: 799.99,
                    rating: 4,
                    stock: false,
                },
                {
                    name: 'Orion RX 6800 XT',
                    image: '3.png',
                    price: 649.99,
                    rating: 3,
                    stock: true,
                },
                {
                    name: 'Vortex RTX 3090',
                    image: '4.png',
                    price: 1499.99,
                    rating: 4,
                    stock: true,
                },
                {
                    name: 'Cosmos GTX 1660 Super',
                    image: '5.png',
                    price: 299.99,
                    rating: 4,
                    stock: false,
                }
            ])

            const colDefs = ref([
                { field: "name" },
                { field: "image" },
                { field: "price" },
                { field: "rating" },
                { field: "stock" }
            ]);

            return {
                items,
                colDefs,
            };
        },
    };
</script>
<style lang="scss">
    .select-box {
        height: 20px;
        width: 120px;
    }
</style>