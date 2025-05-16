// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_win1_25

package fox_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class fox_win1_25 extends MovieClip 
    {

        public function fox_win1_25()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 36, this.frame37);
        }

        internal function frame1():*
        {
        }

        internal function frame5():*
        {
            SSF2API.playSound("fox_win");
        }

        internal function frame37():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package fox_fla

