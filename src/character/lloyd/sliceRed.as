// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//sliceRed

package 
{
    import flash.display.MovieClip;

    public dynamic class sliceRed extends MovieClip 
    {

        public function sliceRed()
        {
            addFrameScript(6, this.frame7);
        }

        internal function frame7():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

