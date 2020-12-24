#/usr/bin/python3

# test for real time python output in the browser.

import datetime
import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output

text = 'test text'

app = dash.Dash(__name__)
app.layout = html.Div(
    html.Div([
        html.H4(text),
        html.Div(id='live-update-text'),
        dcc.Interval(
            id='interval-component',
            interval=1000, # in milliseconds
            n_intervals=0
        )
    ])
)


@app.callback(Output('live-update-text', 'children'),
              Input('interval-component', 'n_intervals'))
def update_metrics(n):
    def Summer():
        c = datetime.datetime.now()
        return c

    style = {'padding': '5px', 'fontSize': '16px'}
    return [
        html.Span(Summer())
    ]

if __name__ == '__main__':
    app.run_server(debug=True)
