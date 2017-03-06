class WorkoutsController < ApplicationController
    before_action :find_workout, only: [:show, :edit, :updeate, :destroy]

        def index
            @workouts = Workout.order("created at DESC")
        end

        def show
        end

        def new
            @workout = Workout.new
        end

        def create
            @workout = Workout.new(workout_params)
            if @workout.save
              redirect_to @workout
             else
                render 'new'
            end
        end

        def edit
        end

        def update
            if @workout.update(workout_params)
            redirect_to @workout
            end
        end

        def destroy
            @workout.destroy
            redirect_to root_path
        end

        private

        def find_workout
            @workout = Workout.find(params[:id])
        end

        def workout_params
            params.require(:wokout).permit(:date, :workout, :mood, :length)
        end

        


end


