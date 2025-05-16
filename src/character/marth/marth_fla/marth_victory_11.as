// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_victory_11

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class marth_victory_11 extends MovieClip 
    {

        public function marth_victory_11()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 13, this.frame14, 21, this.frame22, 33, this.frame34, 39, this.frame40, 41, this.frame42, 42, this.frame43);
        }

        internal function frame1():*
        {
        }

        internal function frame8():*
        {
            SSF2API.playSound("marth_sword_swing1");
        }

        internal function frame14():*
        {
            SSF2API.playSound("marth_sword_swing4");
        }

        internal function frame22():*
        {
            SSF2API.playSound("marth_sword_swing3");
        }

        internal function frame34():*
        {
            SSF2API.playSound("marth_sword_swing2");
        }

        internal function frame40():*
        {
            SSF2API.playSound("marth_win", true);
        }

        internal function frame42():*
        {
            stop();
        }

        internal function frame43():*
        {
            this.gotoAndPlay("stop");
        }


    }
}//package marth_fla

