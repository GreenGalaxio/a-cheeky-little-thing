// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_win_11

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class lloyd_win_11 extends MovieClip 
    {

        public function lloyd_win_11()
        {
            addFrameScript(0, this.frame1, 21, this.frame22, 47, this.frame48);
        }

        internal function frame1():*
        {
        }

        internal function frame22():*
        {
            SSF2API.playSound("lloyd_winVoice");
        }

        internal function frame48():*
        {
            gotoAndPlay("again");
        }


    }
}//package lloyd_fla

