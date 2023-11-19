import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";

const getWeatherData = (): Promise<object | Error> => {
  const appid = "getyourappidatopenweathermap.org";
  // add your location
  const lat = 0.0; 
  const lon = 0.0;

  return fetch(
    `https://api.openweathermap.org/data/2.5/forecast?appid=${appid}&lat=${lat}&lon=${lon}&units=metric`
  )
    .then((res) => {
      if (!res.ok) {
        console.error(
          "There was an error fetching the data, status is: " + res.status
        );
        throw new Error();
      }
      return res.json();
    })
    .catch((e) => {
      throw Error(`There was an error: ${e}`);
    });
};

export const fetchWeatherByLocation = createAsyncThunk(
  "weather/location",
  async (_, thunkAPI) => {
    const response = await getWeatherData();
    if (response instanceof Error) return thunkAPI.rejectWithValue("error");
    
    return response;
  }
);

const locationSlice = createSlice({
  name: "location",
  initialState: {
    value: {},
    status: "idle",
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchWeatherByLocation.pending, (state) => {
        state.status = "loading";
      })
      .addCase(fetchWeatherByLocation.fulfilled, (state, action) => {
        state.status = "succeeded";
        if (action.payload) {
          state.value = action.payload;
        }
      })
      .addCase(fetchWeatherByLocation.rejected, (state) => {
        state.status = "failed";
      });
  },
});

export default locationSlice.reducer;
