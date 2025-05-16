// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_win_12

package zamus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class zamus_win_12 extends MovieClip 
    {

        public function zamus_win_12()
        {
            addFrameScript(0, this.frame1, 39, this.frame40, 47, this.frame48);
        }

        internal function frame1():*
        {
        }

        internal function frame40():*
        {
            SSF2API.playSound("zamus_isThatAll", true);
        }

        internal function frame48():*
        {
            gotoAndPlay("loop");
        }


    }
}//package zamus_fla

