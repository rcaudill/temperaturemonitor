class TemperatureSensorsController < ApplicationController
  # GET /temperature_sensors
  # GET /temperature_sensors.json
  def index
    # @temperature_sensors = TemperatureSensor.last(12)
    @temperature_sensors = TemperatureSensor.where(:address => "10 F6 BD 25 2 8 0 50")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @temperature_sensors }
    end
  end

  # GET /temperature_sensors/1
  # GET /temperature_sensors/1.json
  def show
    @temperature_sensor = TemperatureSensor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @temperature_sensor }
    end
  end

  # GET /temperature_sensors/new
  # GET /temperature_sensors/new.json
  def new
    @temperature_sensor = TemperatureSensor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @temperature_sensor }
    end
  end

  # GET /temperature_sensors/1/edit
  def edit
    @temperature_sensor = TemperatureSensor.find(params[:id])
  end

  # POST /temperature_sensors
  # POST /temperature_sensors.json
  def create
    @temperature_sensor = TemperatureSensor.new(params[:temperature_sensor])

    respond_to do |format|
      if @temperature_sensor.save
        format.html { redirect_to @temperature_sensor, :notice => 'Temperature sensor was successfully created.' }
        format.json { render :json => @temperature_sensor, :status => :created, :location => @temperature_sensor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @temperature_sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /temperature_sensors/1
  # PUT /temperature_sensors/1.json
  def update
    @temperature_sensor = TemperatureSensor.find(params[:id])

    respond_to do |format|
      if @temperature_sensor.update_attributes(params[:temperature_sensor])
        format.html { redirect_to @temperature_sensor, :notice => 'Temperature sensor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @temperature_sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /temperature_sensors/1
  # DELETE /temperature_sensors/1.json
  def destroy
    @temperature_sensor = TemperatureSensor.find(params[:id])
    @temperature_sensor.destroy

    respond_to do |format|
      format.html { redirect_to temperature_sensors_url }
      format.json { head :ok }
    end
  end

  def graph
    @sensor1 = TemperatureSensor.where(:address => "10 F6 BD 25 2 8 0 50")
    @sensor1 = @sensor1.map { |i| "[" + "%d000"%i.time.to_i + "," + i.temperature.to_s + "]" }.join(",")
    @sensor1 = "["+@sensor1+"]"
    @sensor1 = "[[]]"

    @sensor2 = TemperatureSensor.where(:address => "10 4F C4 25 2 8 0 5F")
    @sensor2 = @sensor2.map { |i| "[" + "%d000"%i.time.to_i + "," + i.temperature.to_s + "]" }.join(",")
    @sensor2 = "["+@sensor2+"]"
    respond_to do |format|
      format.html
      format.json { render :json => @sensor1 }
      format.json { render :json => @sensor2 }
    end

  end
end
