// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.captainfalcon_win_11

package captainfalcon_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class captainfalcon_win_11 extends MovieClip 
    {

        public function captainfalcon_win_11()
        {
            addFrameScript(21, this.frame22, 37, this.frame38, 38, this.frame39);
        }

        internal function frame22():*
        {
            SSF2API.playSound("falcon_hyesz", true);
        }

        internal function frame38():*
        {
            stop();
        }

        internal function frame39():*
        {
            this.gotoAndPlay("stop");
        }


    }
}//package captainfalcon_fla

