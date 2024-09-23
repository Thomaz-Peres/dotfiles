/* @refresh reload */
import './index.css';
import { render } from 'solid-js/web';
import { createStore } from 'solid-js/store';
import { init } from 'zebar';
import { logout, toggleDropdown, powerDown, sleep } from './scipts/menu'
import { getNetworkIcon, getBatteryIcon, getWeatherIcon } from './icons';

const zebarCtx = await init();

const providers = await zebarCtx.createProviderGroup({
  network: { type: 'network' },
  glazewm: { type: 'glazewm' },
  cpu: { type: 'cpu' },
  date: { type: 'date', formatting: 'EEE d MMM t' },
  battery: { type: 'battery' },
  memory: { type: 'memory' },
  weather: { type: 'weather' },
});

render(() => <App />, document.getElementById('root')!);

function App() {
  const [output, setOutput] = createStore(providers.outputMap);

  providers.onOutput(outputMap => setOutput(outputMap));

  return (
    <div class="app">

      <div class="left">

        {output.network && (
          <div class="network">
            {getNetworkIcon(output)}
            {output.network.defaultGateway?.ssid}
          </div>
        )}

        <div class="memory">
          <i class="nf nf-fae-chip"></i>
          {Math.round(output.memory.usage)}%
        </div>

        <div class="cpu">
          <i class="nf nf-oct-cpu"></i>

          {/* Change the text color if the CPU usage is high. */}
          <span
            class={output.cpu.usage > 85 ? 'high-usage' : ''}
          >
            {Math.round(output.cpu.usage)}%
          </span>
        </div>

        {output.battery && (
          <div class="battery">
            {/* Show icon for whether battery is charging. */}
            {output.battery.isCharging && (
              <i class="nf nf-md-power_plug charging-icon"></i>
            )}
            {getBatteryIcon(output)}
            {Math.round(output.battery.chargePercent)}%
          </div>
        )}

        {output.weather && (
          <div class="weather">
            {getWeatherIcon(output)}
            {Math.round(output.weather.celsiusTemp)}°C
          </div>
        )}
      </div>

      <div class="center">
        {output.glazewm && (
          <div class="workspaces">
            {output.glazewm.currentWorkspaces.map(workspace => (
              <button
                class={`workspace ${workspace.hasFocus && 'focused'} ${workspace.isDisplayed && 'displayed'}`}
                onClick={() =>
                  output.glazewm.runCommand(
                    `focus --workspace ${workspace.name}`,
                  )
                }
              >
                {workspace.displayName ?? workspace.name}
              </button>
            ))}
          </div>
        )}
      </div>

      <div class="right">

        {output.glazewm && (
          <>
            {output.glazewm.bindingModes.map(bindingMode => (
              <button
                class="binding-mode"
              >
                {bindingMode.displayName ?? bindingMode.name}
              </button>
            ))}

            <button
              class={`tiling-direction nf ${output.glazewm.tilingDirection === 'horizontal' ? 'nf-md-swap_horizontal' : 'nf-md-swap_vertical'}`}
              onClick={() =>
                output.glazewm.runCommand(`toggle-tiling-direction`)
              }
            ></button>
          </>
        )}

        {output.glazewm && (
          <>
            {output.glazewm.allWorkspaces.forEach(workspace => {
              console.log(workspace);
              workspace.children.forEach(child => {
                if (child.processName === "Spotify") {
                  console.log(child);
                  <>
                    {/* <i class="ti ti-music playing"></i> */}
                    <p>nothing is playing</p>
                  </>
                } else {
                  <>
                    {/* <i class="ti ti-music playing"></i> */}
                    <span class={child.title.length > 62 ? "move" : ""}>
                      <p>{child.title}</p>
                    </span>
                  </>
                }
              })
            }
            )}
          </>
        )}

        {output.date.formatted}
      </div>
    </div>
  );
}
