// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_afterimage1

package 
{
    import flash.display.MovieClip;

    public dynamic class kirby_afterimage1 extends MovieClip 
    {

        public function kirby_afterimage1()
        {
            addFrameScript(7, this.frame8);
        }

        internal function frame8():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

